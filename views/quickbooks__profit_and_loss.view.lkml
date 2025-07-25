view: quickbooks__profit_and_loss {
  sql_table_name: `imagination-media-324201.quickbooks_quickbooks.quickbooks__profit_and_loss` ;;

  dimension: date_account_pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: concat(${calendar_raw},${account_name}) ;;
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
  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension_group: calendar {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calendar_date ;;
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

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    drill_fields: [parent_account_name, account_name]
    value_format_name: usd
  }
}
