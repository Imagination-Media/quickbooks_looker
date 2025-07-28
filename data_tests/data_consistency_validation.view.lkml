view: data_consistency_validation {
  derived_table: {
    sql:
      SELECT 
        'invoice_amounts_non_negative' as test_name,
        'Invoice total amounts should be non-negative' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN total_amount >= 0 THEN 1 END) as valid_records,
        COUNT(CASE WHEN total_amount < 0 THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN total_amount >= 0 THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN total_amount < 0 THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice`
      WHERE total_amount IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'invoice_balance_reasonable' as test_name,
        'Invoice balance should not exceed total amount' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN balance <= total_amount THEN 1 END) as valid_records,
        COUNT(CASE WHEN balance > total_amount THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN balance <= total_amount THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN balance > total_amount THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice`
      WHERE balance IS NOT NULL AND total_amount IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'invoice_dates_not_future' as test_name,
        'Invoice transaction dates should not be in the future' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN transaction_date <= CURRENT_DATE() THEN 1 END) as valid_records,
        COUNT(CASE WHEN transaction_date > CURRENT_DATE() THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN transaction_date <= CURRENT_DATE() THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN transaction_date > CURRENT_DATE() THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice`
      WHERE transaction_date IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'customer_email_format' as test_name,
        'Customer email addresses should be valid format' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN REGEXP_CONTAINS(email, r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN 1 END) as valid_records,
        COUNT(CASE WHEN NOT REGEXP_CONTAINS(email, r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN REGEXP_CONTAINS(email, r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN NOT REGEXP_CONTAINS(email, r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.customer`
      WHERE email IS NOT NULL AND email != ''
      
      UNION ALL
      
      SELECT 
        'customer_balance_reasonable' as test_name,
        'Customer balance should be numeric and reasonable' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN balance BETWEEN -1000000 AND 1000000 THEN 1 END) as valid_records,
        COUNT(CASE WHEN balance NOT BETWEEN -1000000 AND 1000000 THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN balance BETWEEN -1000000 AND 1000000 THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN balance NOT BETWEEN -1000000 AND 1000000 THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.customer`
      WHERE balance IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'account_name_not_null' as test_name,
        'Account names should not be null for active accounts' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN name IS NOT NULL AND name != '' THEN 1 END) as valid_records,
        COUNT(CASE WHEN name IS NULL OR name = '' THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN name IS NOT NULL AND name != '' THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN name IS NULL OR name = '' THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.account`
      WHERE active = true OR active IS NULL
      
      UNION ALL
      
      SELECT 
        'general_ledger_amounts_reasonable' as test_name,
        'General ledger amounts should be reasonable' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN amount BETWEEN -10000000 AND 10000000 THEN 1 END) as valid_records,
        COUNT(CASE WHEN amount NOT BETWEEN -10000000 AND 10000000 THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN amount BETWEEN -10000000 AND 10000000 THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN amount NOT BETWEEN -10000000 AND 10000000 THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__general_ledger`
      WHERE amount IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'exchange_rate_reasonable' as test_name,
        'Exchange rates should be positive and reasonable' as test_description,
        COUNT(*) as total_records,
        COUNT(CASE WHEN exchange_rate > 0 AND exchange_rate <= 1000 THEN 1 END) as valid_records,
        COUNT(CASE WHEN exchange_rate <= 0 OR exchange_rate > 1000 THEN 1 END) as invalid_records,
        ROUND((COUNT(CASE WHEN exchange_rate > 0 AND exchange_rate <= 1000 THEN 1 END) * 100.0 / COUNT(*)), 2) as validity_percentage,
        CASE WHEN COUNT(CASE WHEN exchange_rate <= 0 OR exchange_rate > 1000 THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice`
      WHERE exchange_rate IS NOT NULL
    ;;
  }

  dimension: test_name {
    type: string
    sql: ${TABLE}.test_name ;;
    description: "Name of the data consistency test"
  }

  dimension: test_description {
    type: string
    sql: ${TABLE}.test_description ;;
    description: "Description of what the test validates"
  }

  dimension: total_records {
    type: number
    sql: ${TABLE}.total_records ;;
    description: "Total number of records tested"
  }

  dimension: valid_records {
    type: number
    sql: ${TABLE}.valid_records ;;
    description: "Number of records that passed the validation"
  }

  dimension: invalid_records {
    type: number
    sql: ${TABLE}.invalid_records ;;
    description: "Number of records that failed the validation"
  }

  dimension: validity_percentage {
    type: number
    sql: ${TABLE}.validity_percentage ;;
    description: "Percentage of records that passed validation"
    value_format: "#,##0.00\%"
  }

  dimension: test_result {
    type: string
    sql: ${TABLE}.test_result ;;
    description: "Test result: PASS if all records are valid, FAIL if any invalid records found"
  }

  measure: total_tests {
    type: count
    description: "Total number of data consistency tests"
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

  measure: total_invalid_records {
    type: sum
    sql: ${invalid_records} ;;
    description: "Total number of invalid records across all tests"
  }

  measure: overall_consistency_percentage {
    type: number
    sql: ROUND((${passed_tests} * 100.0 / NULLIF(${total_tests}, 0)), 2) ;;
    description: "Overall percentage of data consistency tests that passed"
    value_format: "#,##0.00\%"
  }
}
