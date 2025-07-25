view: quickbooks__expenses_sales_enhanced {
  sql_table_name: `im-datalake.im_quickbooks_quickbooks.quickbooks__expenses_sales_enhanced` ;;

  dimension: transaction_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }
  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: account_sub_type {
    type: string
    sql: ${TABLE}.account_sub_type ;;
  }
  dimension: unit_amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: billable_status {
    type: string
    sql: ${TABLE}.billable_status ;;
  }
  dimension: class_id {
    type: string
    sql: ${TABLE}.class_id ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: customer_name {
    type: string
    sql: ${TABLE}.customer_name ;;
  }
  dimension: customer_website {
    type: string
    sql: ${TABLE}.customer_website ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.department_id ;;
  }
  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }
  dimension: doc_number {
    type: string
    sql: ${TABLE}.doc_number ;;
  }
  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
  }
  dimension: item_quantity {
    type: number
    sql: ${TABLE}.item_quantity ;;
  }
  dimension: item_unit_price {
    type: number
    sql: ${TABLE}.item_unit_price ;;
  }
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  dimension: total_transaction_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_line_id {
    type: number
    sql: ${TABLE}.transaction_line_id ;;
  }
  dimension: transaction_source {
    type: string
    sql: ${TABLE}.transaction_source ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  measure: count {
    type: count
    drill_fields: [vendor_name, account_name, customer_name]
  }

  measure: total_amount {
    type: sum
    sql: ${unit_amount} ;;
    value_format_name: usd
    drill_fields: [vendor_name, account_name, customer_name]
  }

}
