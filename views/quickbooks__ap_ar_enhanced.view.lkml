view: quickbooks__ap_ar_enhanced {
  sql_table_name: `im-datalake.im_quickbooks_quickbooks.quickbooks__ap_ar_enhanced` ;;

  dimension: transaction_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: current_balance {
    type: number
    sql: ${TABLE}.current_balance ;;
  }
  dimension: customer_vendor_address_city {
    type: string
    sql: ${TABLE}.customer_vendor_address_city ;;
  }
  dimension: customer_vendor_address_country {
    type: string
    sql: ${TABLE}.customer_vendor_address_country ;;
  }
  dimension: customer_vendor_address_line {
    type: string
    sql: ${TABLE}.customer_vendor_address_line ;;
  }
  dimension: customer_vendor_balance {
    type: number
    sql: ${TABLE}.customer_vendor_balance ;;
  }
  dimension: customer_vendor_name {
    type: string
    sql: ${TABLE}.customer_vendor_name ;;
  }
  dimension: customer_vendor_website {
    type: string
    sql: ${TABLE}.customer_vendor_website ;;
  }
  dimension: days_overdue {
    type: number
    sql: ${TABLE}.days_overdue ;;
  }
  dimension: delivery_type {
    type: string
    sql: ${TABLE}.delivery_type ;;
  }
  dimension: doc_number {
    type: string
    sql: ${TABLE}.doc_number ;;
  }
  dimension_group: due {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.due_date ;;
  }
  dimension: estimate_amount {
    type: number
    sql: ${TABLE}.estimate_amount ;;
  }
  dimension: estimate_id {
    type: string
    sql: ${TABLE}.estimate_id ;;
  }
  dimension: estimate_status {
    type: string
    sql: ${TABLE}.estimate_status ;;
  }
  dimension_group: initial_payment {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.initial_payment_date ;;
  }
  dimension: is_overdue {
    type: yesno
    sql: ${TABLE}.is_overdue ;;
  }
  dimension_group: recent_payment {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.recent_payment_date ;;
  }
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension: current_payment {
    type: number
    sql: ${TABLE}.total_current_payment ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: transaction_with {
    type: string
    sql: ${TABLE}.transaction_with ;;
  }
  measure: count {
    type: count
    drill_fields: [customer_vendor_name]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [customer_vendor_name]
  }

  measure: total_customer_vendor_balance {
    type: sum
    sql: ${customer_vendor_balance} ;;
    value_format_name: usd
    drill_fields: [customer_vendor_name]
  }

  measure: total_estimate_amount {
    type: sum
    sql: ${estimate_amount} ;;
    value_format_name: usd
    drill_fields: [customer_vendor_name]
  }

  measure: total_current_balance {
    type: sum
    sql: ${current_balance} ;;
    value_format_name: usd
    drill_fields: [customer_vendor_name]
  }

  measure: total_current_payment {
    type: sum
    sql: ${current_payment} ;;
    value_format_name: usd
    drill_fields: [customer_vendor_name]
  }

}
