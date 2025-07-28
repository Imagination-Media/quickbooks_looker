#!/usr/bin/env python3
"""
Schema validator for Quickbooks LookML views against BigQuery schemas
Adapted from HubSpot Marketing project for Quickbooks data validation
"""

import os
import json
import re
import glob
from google.cloud import bigquery
from google.oauth2 import service_account

def authenticate_bigquery():
    """Authenticate with BigQuery using service account credentials"""
    service_account_json = os.environ.get('BQ_Service_Acct_for_IM_DATALAKE')
    project_id = os.environ.get('IM_Datalake_Project_ID', 'im-datalake')
    
    if not service_account_json:
        raise ValueError("BQ_Service_Acct_for_IM_DATALAKE environment variable not found")
    
    try:
        credentials_info = json.loads(service_account_json)
    except json.JSONDecodeError as e:
        raise ValueError(f"Failed to parse service account JSON: {e}")
    
    credentials = service_account.Credentials.from_service_account_info(credentials_info)
    client = bigquery.Client(credentials=credentials, project=project_id)
    
    return client

def get_table_schema(client, table_name):
    """Get BigQuery table schema"""
    try:
        if 'quickbooks__' in table_name:
            full_table_name = f"im-datalake.im_quickbooks_quickbooks.{table_name}"
        else:
            full_table_name = f"im-datalake.im_quickbooks.{table_name}"
            
        table = client.get_table(full_table_name)
        schema = {}
        for field in table.schema:
            schema[field.name] = field.field_type
        return schema
    except Exception as e:
        print(f"Error getting schema for {table_name}: {e}")
        return None

def parse_lookml_view(file_path):
    """Parse LookML view file and extract dimensions and measures"""
    with open(file_path, 'r') as f:
        content = f.read()
    
    view_name = None
    sql_table_name = None
    dimensions = {}
    measures = {}
    
    view_match = re.search(r'view:\s*(\w+)', content)
    if view_match:
        view_name = view_match.group(1)
    
    sql_table_match = re.search(r'sql_table_name:\s*`([^`]+)`', content)
    if sql_table_match:
        sql_table_name = sql_table_match.group(1).split('.')[-1]
    
    dimension_blocks = re.findall(r'dimension(?:_group)?:\s*(\w+)\s*\{[^}]*type:\s*(\w+)[^}]*sql:\s*\$\{TABLE\}\.(\w+)', content, re.DOTALL)
    for dim_name, dim_type, sql_field in dimension_blocks:
        dimensions[sql_field] = {
            'name': dim_name,
            'type': dim_type,
            'sql_field': sql_field
        }
    
    measure_blocks = re.findall(r'measure:\s*(\w+)\s*\{[^}]*type:\s*(\w+)', content, re.DOTALL)
    for measure_name, measure_type in measure_blocks:
        measures[measure_name] = {
            'name': measure_name,
            'type': measure_type
        }
    
    return {
        'view_name': view_name,
        'sql_table_name': sql_table_name,
        'dimensions': dimensions,
        'measures': measures
    }

def validate_view_schema(client, view_info):
    """Validate LookML view against BigQuery schema"""
    if not view_info['sql_table_name']:
        return {'status': 'skipped', 'reason': 'No SQL table name found'}
    
    bq_schema = get_table_schema(client, view_info['sql_table_name'])
    if not bq_schema:
        return {'status': 'error', 'reason': 'Could not retrieve BigQuery schema'}
    
    mismatches = []
    
    for sql_field, dim_info in view_info['dimensions'].items():
        if sql_field not in bq_schema:
            mismatches.append({
                'field': sql_field,
                'issue': 'Field not found in BigQuery schema',
                'lookml_type': dim_info['type'],
                'bigquery_type': None
            })
        else:
            lookml_type = dim_info['type']
            bq_type = bq_schema[sql_field]
            
            if not types_compatible(lookml_type, bq_type):
                mismatches.append({
                    'field': sql_field,
                    'issue': 'Type mismatch',
                    'lookml_type': lookml_type,
                    'bigquery_type': bq_type
                })
    
    return {
        'status': 'validated',
        'mismatches': mismatches,
        'bq_schema': bq_schema
    }

def types_compatible(lookml_type, bq_type):
    """Check if LookML and BigQuery types are compatible"""
    type_mappings = {
        'string': ['STRING', 'BYTES'],
        'number': ['INTEGER', 'INT64', 'FLOAT', 'FLOAT64', 'NUMERIC', 'BIGNUMERIC'],
        'date': ['DATE'],
        'time': ['TIMESTAMP', 'DATETIME', 'TIME'],
        'yesno': ['BOOLEAN', 'BOOL']
    }
    
    if lookml_type in type_mappings:
        return bq_type in type_mappings[lookml_type]
    
    return True

def check_foreign_key_relationships():
    """Check foreign key relationships defined in the model"""
    model_file = 'models/quickbooks.model.lkml'
    if not os.path.exists(model_file):
        return []
    
    with open(model_file, 'r') as f:
        content = f.read()
    
    join_blocks = re.findall(r'join:\s*(\w+)\s*\{[^}]*sql_on:\s*([^;]+)', content, re.DOTALL)
    
    relationships = []
    for join_table, sql_on in join_blocks:
        sql_on_clean = re.sub(r'\s+', ' ', sql_on.strip())
        relationships.append({
            'join_table': join_table,
            'sql_on': sql_on_clean
        })
    
    return relationships

def generate_validation_report(results, foreign_keys):
    """Generate validation report"""
    report = "# Quickbooks LookML to BigQuery Schema Validation Report\n\n"
    report += "## Summary\n\n"
    
    total_views = len(results)
    views_with_mismatches = sum(1 for r in results if r['validation']['status'] == 'validated' and r['validation']['mismatches'])
    
    report += f"- Total views analyzed: {total_views}\n"
    report += f"- Views with schema mismatches: {views_with_mismatches}\n\n"
    
    report += "## Schema Validation Results\n\n"
    
    for result in results:
        view_name = result['view_info']['view_name']
        sql_table_name = result['view_info']['sql_table_name']
        validation = result['validation']
        
        report += f"### {view_name}\n\n"
        report += f"- SQL Table Name: `{sql_table_name}`\n"
        
        if validation['status'] == 'validated':
            if validation['mismatches']:
                report += f"- **❌ {len(validation['mismatches'])} schema mismatches found**\n\n"
                report += "| Field | Issue | LookML Type | BigQuery Type |\n"
                report += "|-------|-------|-------------|---------------|\n"
                for mismatch in validation['mismatches']:
                    report += f"| {mismatch['field']} | {mismatch['issue']} | {mismatch['lookml_type']} | {mismatch['bigquery_type']} |\n"
            else:
                report += "- **✅ No schema mismatches found**\n"
        else:
            report += f"- **⚠️ {validation['reason']}**\n"
        
        report += "\n"
    
    report += "\n## Foreign Key Relationship Validation\n\n"
    
    if foreign_keys:
        report += "- **✅ Foreign key relationships found in model:**\n\n"
        for fk in foreign_keys:
            report += f"  - {fk['join_table']}: {fk['sql_on']}\n"
    else:
        report += "- **✅ No foreign key relationship issues found**\n"
    
    report += "\n"
    
    return report

def main():
    """Main validation function"""
    try:
        client = authenticate_bigquery()
        print("✓ Successfully authenticated with BigQuery")
        
        view_files = glob.glob('views/*.view.lkml')
        view_files.extend(glob.glob('data_tests/*.view.lkml'))
        
        if not view_files:
            print("No LookML view files found")
            return
        
        print(f"Found {len(view_files)} view files to validate")
        
        results = []
        
        for view_file in view_files:
            print(f"Validating {view_file}...")
            
            view_info = parse_lookml_view(view_file)
            if not view_info['view_name']:
                print(f"  ⚠️ Could not parse view name from {view_file}")
                continue
            
            validation = validate_view_schema(client, view_info)
            
            results.append({
                'file': view_file,
                'view_info': view_info,
                'validation': validation
            })
            
            if validation['status'] == 'validated':
                if validation['mismatches']:
                    print(f"  ❌ {len(validation['mismatches'])} schema mismatches found")
                else:
                    print(f"  ✅ No schema mismatches")
            else:
                print(f"  ⚠️ {validation['reason']}")
        
        print("\nChecking foreign key relationships...")
        foreign_keys = check_foreign_key_relationships()
        print(f"Found {len(foreign_keys)} foreign key relationships in model")
        
        print("\nGenerating validation report...")
        report = generate_validation_report(results, foreign_keys)
        
        with open('validation_report.md', 'w') as f:
            f.write(report)
        
        print("✓ Validation report saved to validation_report.md")
        
        total_mismatches = sum(len(r['validation'].get('mismatches', [])) for r in results)
        if total_mismatches > 0:
            print(f"\n⚠️ Found {total_mismatches} total schema mismatches")
            return 1
        else:
            print("\n✅ All views passed schema validation")
            return 0
        
    except Exception as e:
        print(f"ERROR: Validation failed: {e}")
        return 1

if __name__ == "__main__":
    exit(main())
