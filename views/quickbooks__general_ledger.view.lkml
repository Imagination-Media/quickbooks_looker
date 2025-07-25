view: quickbooks__general_ledger {
  sql_table_name: `imagination-media-324201.quickbooks_quickbooks.quickbooks__general_ledger` ;;

  dimension: transaction_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: account_class {
    type: string
    sql: ${TABLE}.account_class ;;
  }
  dimension: account_current_balance {
    type: number
    sql: ${TABLE}.account_current_balance ;;
  }
  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }
  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }
  dimension: account_sub_type {
    type: string
    sql: ${TABLE}.account_sub_type ;;
  }
  dimension: account_transaction_type {
    type: string
    sql: ${TABLE}.account_transaction_type ;;
  }
  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }
  dimension: adjusted_amount {
    type: number
    sql: ${TABLE}.adjusted_amount ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: class_id {
    type: string
    sql: ${TABLE}.class_id ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.department_id ;;
  }
  dimension: financial_statement_helper {
    type: string
    sql: ${TABLE}.financial_statement_helper ;;
  }
  dimension: is_sub_account {
    type: yesno
    sql: ${TABLE}.is_sub_account ;;
  }
  dimension: parent_account_name {
    type: string
    sql: ${TABLE}.parent_account_name ;;
  }
  dimension: parent_account_number {
    type: string
    sql: ${TABLE}.parent_account_number ;;
  }
  dimension: running_balance {
    type: number
    sql: ${TABLE}.running_balance ;;
  }
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_index {
    type: number
    sql: ${TABLE}.transaction_index ;;
  }
  dimension: transaction_source {
    type: string
    sql: ${TABLE}.transaction_source ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }
  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }
  measure: count {
    type: count
    drill_fields: [account_name, parent_account_name]
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [account_name, parent_account_name]
  }

  measure: total_adjusted_amount {
    type: sum
    sql: ${adjusted_amount} ;;
    value_format_name: usd
    drill_fields: [account_name, parent_account_name]
  }

  measure: total_account_current_balance {
    type: sum
    sql: ${account_current_balance} ;;
    value_format_name: usd
    drill_fields: [account_name, parent_account_name]
  }

  measure: max_running_balance {
    type: max
    sql: ${running_balance} ;;
    value_format_name: usd
    drill_fields: [account_name, parent_account_name]
  }

  measure: calculated_running_balance {
    type: running_total
    sql: ${total_account_current_balance} ;;
    value_format_name: usd
    drill_fields: [account_name, parent_account_name]
  }

}
