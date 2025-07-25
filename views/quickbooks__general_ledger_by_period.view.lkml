view: quickbooks__general_ledger_by_period {
  sql_table_name: `imagination-media-324201.quickbooks_quickbooks.quickbooks__general_ledger_by_period` ;;

  dimension: account_period_pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(coalesce(${account_id}," "),${period_first_day_raw}) ;;
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
  dimension: account_ordinal {
    type: number
    sql: ${TABLE}.account_ordinal ;;
  }
  dimension: account_sub_type {
    type: string
    sql: ${TABLE}.account_sub_type ;;
  }
  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }
  dimension: class_id {
    type: string
    sql: ${TABLE}.class_id ;;
  }
  dimension_group: date_year {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_year ;;
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
  dimension: period_beginning_balance {
    type: number
    sql: ${TABLE}.period_beginning_balance ;;
  }
  dimension: period_ending_balance {
    type: number
    sql: ${TABLE}.period_ending_balance ;;
  }
  dimension_group: period_first_day {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.period_first_day ;;
  }
  dimension_group: period_last_day {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.period_last_day ;;
  }
  dimension: period_net_change {
    type: number
    sql: ${TABLE}.period_net_change ;;
  }
  dimension: source_relation {
    type: string
    sql: ${TABLE}.source_relation ;;
  }
  measure: count {
    type: count
    drill_fields: [parent_account_name, account_name]
  }

  measure: total_period_net_change {
    type: sum
    sql: ${period_net_change} ;;
    value_format_name: usd
    drill_fields: [parent_account_name, account_name]
  }

  measure: total_period_beginning_balance {
    type: sum
    sql: ${period_beginning_balance} ;;
    value_format_name: usd
    drill_fields: [parent_account_name, account_name]
  }

  measure: total_period_ending_balance {
    type: sum
    sql: ${period_ending_balance} ;;
    drill_fields: [parent_account_name, account_name]
    value_format_name: usd
  }


}
