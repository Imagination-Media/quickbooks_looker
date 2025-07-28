#!/usr/bin/env python3
"""
Basic LookML syntax checker for offline validation
"""
import os
import re
import sys
from pathlib import Path

def check_lookml_syntax(file_path):
    """Basic LookML syntax validation"""
    errors = []
    
    with open(file_path, 'r') as f:
        content = f.read()
        lines = content.split('\n')
    
    brace_count = 0
    for i, line in enumerate(lines, 1):
        brace_count += line.count('{') - line.count('}')
        
        if re.search(r'^\s*[a-zA-Z_][a-zA-Z0-9_]*\s*:\s*$', line):
            errors.append(f"Line {i}: Missing value after colon")
        
        if line.count('"') % 2 != 0:
            errors.append(f"Line {i}: Unterminated string")
    
    if brace_count != 0:
        errors.append(f"Unbalanced braces: {brace_count}")
    
    return errors

def main():
    """Main linting function"""
    repo_root = Path.cwd()
    lookml_files = list(repo_root.glob('**/*.lkml'))
    
    if not lookml_files:
        print("No LookML files found")
        return 0
    
    total_errors = 0
    
    for file_path in lookml_files:
        errors = check_lookml_syntax(file_path)
        if errors:
            print(f"\n{file_path}:")
            for error in errors:
                print(f"  {error}")
            total_errors += len(errors)
    
    if total_errors == 0:
        print("✓ All LookML files passed basic syntax check")
        return 0
    else:
        print(f"\n✗ Found {total_errors} syntax errors")
        return 1

if __name__ == "__main__":
    sys.exit(main())
