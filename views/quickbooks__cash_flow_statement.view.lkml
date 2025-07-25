view: quickbooks__cash_flow_statement {
  sql_table_name: `im-datalake.im_quickbooks_quickbooks.quickbooks__cash_flow_statement` ;;

  dimension: account_unique_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.account_unique_id ;;
  }

  dimension: account_class {
    type: string
    sql: ${TABLE}.account_class ;;
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
  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: cash_beginning_period {
    type: number
    sql: ${TABLE}.cash_beginning_period ;;
  }
  dimension: cash_ending_period {
    type: number
    sql: ${TABLE}.cash_ending_period ;;
  }
  dimension: cash_flow_ordinal {
    type: number
    sql: ${TABLE}.cash_flow_ordinal ;;
  }
  dimension_group: cash_flow_period {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.cash_flow_period ;;
  }
  dimension: cash_flow_type {
    type: string
    sql: ${TABLE}.cash_flow_type ;;
  }
  dimension: cash_net_period {
    type: number
    sql: ${TABLE}.cash_net_period ;;
  }
  dimension: class_id {
    type: string
    sql: ${TABLE}.class_id ;;
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
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  measure: count {
    type: count
    drill_fields: [parent_account_name, account_name]
  }

  measure: total_cash_ending_period {
    type: sum
    sql: ${cash_ending_period} ;;
    value_format_name: usd
    drill_fields: [parent_account_name, account_name]
  }

  measure: total_cash_beginning_period {
    type: sum
    sql: ${cash_beginning_period} ;;
    value_format_name: usd
    drill_fields: [parent_account_name, account_name]
  }

  measure: total_cash_net_period {
    type: sum
    sql: ${cash_net_period} ;;
    value_format_name: usd
    drill_fields: [parent_account_name, account_name]
  }
}
