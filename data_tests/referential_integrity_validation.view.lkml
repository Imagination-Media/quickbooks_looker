view: referential_integrity_validation {
  derived_table: {
    sql:
      SELECT 
        'invoice_to_customer' as relationship_name,
        'invoice.customer_id -> customer.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN c.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN i.customer_id IS NOT NULL AND c.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN i.customer_id IS NOT NULL AND c.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice` i
      LEFT JOIN `im-datalake.im_quickbooks.customer` c ON i.customer_id = c.id
      WHERE i.customer_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'invoice_to_deposit_account' as relationship_name,
        'invoice.deposit_to_account_id -> account.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN a.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN i.deposit_to_account_id IS NOT NULL AND a.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN i.deposit_to_account_id IS NOT NULL AND a.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.invoice` i
      LEFT JOIN `im-datalake.im_quickbooks.account` a ON i.deposit_to_account_id = a.id
      WHERE i.deposit_to_account_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'bill_to_vendor' as relationship_name,
        'bill.vendor_id -> vendor.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN v.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN b.vendor_id IS NOT NULL AND v.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN b.vendor_id IS NOT NULL AND v.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.bill` b
      LEFT JOIN `im-datalake.im_quickbooks.vendor` v ON b.vendor_id = v.id
      WHERE b.vendor_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'customer_to_ar_account' as relationship_name,
        'customer.ar_account_id -> account.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN a.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN c.ar_account_id IS NOT NULL AND a.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN c.ar_account_id IS NOT NULL AND a.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks.customer` c
      LEFT JOIN `im-datalake.im_quickbooks.account` a ON c.ar_account_id = a.id
      WHERE c.ar_account_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'general_ledger_to_account' as relationship_name,
        'quickbooks__general_ledger.account_id -> account.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN a.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN gl.account_id IS NOT NULL AND a.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN gl.account_id IS NOT NULL AND a.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__general_ledger` gl
      LEFT JOIN `im-datalake.im_quickbooks.account` a ON gl.account_id = a.id
      WHERE gl.account_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'general_ledger_to_customer' as relationship_name,
        'quickbooks__general_ledger.customer_id -> customer.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN c.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN gl.customer_id IS NOT NULL AND c.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN gl.customer_id IS NOT NULL AND c.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__general_ledger` gl
      LEFT JOIN `im-datalake.im_quickbooks.customer` c ON gl.customer_id = c.id
      WHERE gl.customer_id IS NOT NULL
      
      UNION ALL
      
      SELECT 
        'general_ledger_to_vendor' as relationship_name,
        'quickbooks__general_ledger.vendor_id -> vendor.id' as relationship_description,
        COUNT(*) as total_child_records,
        COUNT(CASE WHEN v.id IS NOT NULL THEN 1 END) as valid_references,
        COUNT(CASE WHEN gl.vendor_id IS NOT NULL AND v.id IS NULL THEN 1 END) as orphaned_records,
        CASE WHEN COUNT(CASE WHEN gl.vendor_id IS NOT NULL AND v.id IS NULL THEN 1 END) = 0 THEN 'PASS' ELSE 'FAIL' END as test_result
      FROM `im-datalake.im_quickbooks_quickbooks.quickbooks__general_ledger` gl
      LEFT JOIN `im-datalake.im_quickbooks.vendor` v ON gl.vendor_id = v.id
      WHERE gl.vendor_id IS NOT NULL
    ;;
  }

  dimension: relationship_name {
    type: string
    sql: ${TABLE}.relationship_name ;;
    description: "Name of the relationship being validated"
  }

  dimension: relationship_description {
    type: string
    sql: ${TABLE}.relationship_description ;;
    description: "Description of the foreign key relationship"
  }

  dimension: total_child_records {
    type: number
    sql: ${TABLE}.total_child_records ;;
    description: "Total number of child records with non-null foreign keys"
  }

  dimension: valid_references {
    type: number
    sql: ${TABLE}.valid_references ;;
    description: "Number of child records with valid parent references"
  }

  dimension: orphaned_records {
    type: number
    sql: ${TABLE}.orphaned_records ;;
    description: "Number of child records with invalid parent references"
  }

  dimension: test_result {
    type: string
    sql: ${TABLE}.test_result ;;
    description: "Test result: PASS if no orphaned records, FAIL if orphaned records found"
  }

  measure: total_tests {
    type: count
    description: "Total number of referential integrity tests"
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

  measure: total_orphaned_records {
    type: sum
    sql: ${orphaned_records} ;;
    description: "Total number of orphaned records across all relationships"
  }

  measure: integrity_percentage {
    type: number
    sql: ROUND((${passed_tests} * 100.0 / NULLIF(${total_tests}, 0)), 2) ;;
    description: "Percentage of referential integrity tests that passed"
    value_format: "#,##0.00\%"
  }
}
