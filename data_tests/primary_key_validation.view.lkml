view: primary_key_validation {
  derived_table: {
    sql: 
      SELECT 
        'invoice' as table_name,
        'id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT id) as unique_records,
        COUNT(*) - COUNT(DISTINCT id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice`
      WHERE id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'customer' as table_name,
        'id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT id) as unique_records,
        COUNT(*) - COUNT(DISTINCT id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.customer`
      WHERE id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'account' as table_name,
        'id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT id) as unique_records,
        COUNT(*) - COUNT(DISTINCT id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.account`
      WHERE id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'vendor' as table_name,
        'id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT id) as unique_records,
        COUNT(*) - COUNT(DISTINCT id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.vendor`
      WHERE id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'bill' as table_name,
        'id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT id) as unique_records,
        COUNT(*) - COUNT(DISTINCT id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.bill`
      WHERE id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'quickbooks__ap_ar_enhanced' as table_name,
        'transaction_id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT transaction_id) as unique_records,
        COUNT(*) - COUNT(DISTINCT transaction_id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT transaction_id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__ap_ar_enhanced`
      WHERE transaction_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'quickbooks__general_ledger' as table_name,
        'transaction_id' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT transaction_id) as unique_records,
        COUNT(*) - COUNT(DISTINCT transaction_id) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT transaction_id) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__general_ledger`
      WHERE transaction_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'quickbooks__profit_and_loss' as table_name,
        'date_account_pk' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT date_account_pk) as unique_records,
        COUNT(*) - COUNT(DISTINCT date_account_pk) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT date_account_pk) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__profit_and_loss`
      WHERE date_account_pk IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'quickbooks__balance_sheet' as table_name,
        'calendar_date_pk' as primary_key_field,
        COUNT(*) as total_records,
        COUNT(DISTINCT calendar_date_pk) as unique_records,
        COUNT(*) - COUNT(DISTINCT calendar_date_pk) as duplicate_count,
        CASE WHEN COUNT(*) = COUNT(DISTINCT calendar_date_pk) THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__balance_sheet`
      WHERE calendar_date_pk IS NOT NULL
    ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
    description: "Name of the table being validated"
  }

  dimension: primary_key_field {
    type: string
    sql: ${TABLE}.primary_key_field ;;
    description: "Name of the primary key field"
  }

  dimension: total_records {
    type: number
    sql: ${TABLE}.total_records ;;
    description: "Total number of records in the table"
  }

  dimension: unique_records {
    type: number
    sql: ${TABLE}.unique_records ;;
    description: "Number of unique primary key values"
  }

  dimension: duplicate_count {
    type: number
    sql: ${TABLE}.duplicate_count ;;
    description: "Number of duplicate primary key values"
  }

  dimension: test_result {
    type: string
    sql: ${TABLE}.test_result ;;
    description: "Test result: PASS if no duplicates, FAIL if duplicates found"
  }

  measure: total_tests {
    type: count
    description: "Total number of primary key validation tests"
  }

  measure: passed_tests {
    type: count
    filters: [test_result: "PASS"]
    description: "Number of tests that passed"
  }

  measure: failed_tests {
    type: count
    filters: [test_result: "FAIL"]
    description: "Number of tests that failed"
  }

  measure: total_duplicate_records {
    type: sum
    sql: ${duplicate_count} ;;
    description: "Total number of duplicate records across all tables"
  }

  measure: pass_rate_percentage {
    type: number
    sql: ROUND((${passed_tests} * 100.0 / NULLIF(${total_tests}, 0)), 2) ;;
    description: "Percentage of tests that passed"
    value_format: "#,##0.00\%"
  }
}
