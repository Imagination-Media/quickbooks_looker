view: quickbooks__balance_sheet {
  sql_table_name: `imagination-media-324201.quickbooks_quickbooks.quickbooks__balance_sheet` ;;

  dimension: calendar_date_pk {
    hidden: yes
    primary_key: yes
    type: string
    datatype: date
    sql: ${TABLE}.calendar_date ;;
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
    value_format_name: usd
    drill_fields: [parent_account_name, account_name]
  }

  # dimension: test_amount {
  #   type:number
  #   sql:
  #   case(when(${account_ordinal}=2 AND ${amount}>0 THEN (${amount}* -1)),
  # when(${account_ordinal}=2 AND ${amount}<0 THEN (${amount}))
  # ELSE ${amount})

  #   ;;
  # }

  # measure: total_test_amount {
  #   type: sum
  #   sql: ${test_amount} ;;
  #   value_format_name: usd
  #   drill_fields: [parent_account_name, account_name]
  # }

}
