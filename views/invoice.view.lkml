view: invoice {
  sql_table_name: `imagination-media-324201.quickbooks.invoice` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._fivetran_deleted ;;
  }
  dimension_group: _fivetran_synced {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._fivetran_synced ;;
  }
  dimension: allow_ipnpayment {
    type: yesno
    sql: ${TABLE}.allow_ipnpayment ;;
  }
  dimension: allow_online_achpayment {
    type: yesno
    sql: ${TABLE}.allow_online_achpayment ;;
  }
  dimension: allow_online_credit_card_payment {
    type: yesno
    sql: ${TABLE}.allow_online_credit_card_payment ;;
  }
  dimension: allow_online_payment {
    type: yesno
    sql: ${TABLE}.allow_online_payment ;;
  }
  dimension: apply_tax_after_discount {
    type: yesno
    sql: ${TABLE}.apply_tax_after_discount ;;
  }
  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }
  dimension: billing_address_id {
    type: string
    sql: ${TABLE}.billing_address_id ;;
  }
  dimension: billing_bcc_email {
    type: string
    sql: ${TABLE}.billing_bcc_email ;;
  }
  dimension: billing_cc_email {
    type: string
    sql: ${TABLE}.billing_cc_email ;;
  }
  dimension: billing_email {
    type: string
    sql: ${TABLE}.billing_email ;;
  }
  dimension: class_id {
    type: string
    sql: ${TABLE}.class_id ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: currency_id {
    type: string
    sql: ${TABLE}.currency_id ;;
  }
  dimension: custom_jira_project_key {
    type: string
    sql: ${TABLE}.custom_jira_project_key ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }
  dimension: customer_memo {
    type: string
    sql: ${TABLE}.customer_memo ;;
  }
  dimension_group: delivery {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.delivery_time ;;
  }
  dimension: delivery_type {
    type: string
    sql: ${TABLE}.delivery_type ;;
  }
  dimension: department_id {
    type: string
    sql: ${TABLE}.department_id ;;
  }
  dimension: deposit {
    type: number
    sql: ${TABLE}.deposit ;;
  }
  dimension: deposit_to_account_id {
    type: string
    sql: ${TABLE}.deposit_to_account_id ;;
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
  dimension: email_status {
    type: string
    sql: ${TABLE}.email_status ;;
  }
  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.exchange_rate ;;
  }
  dimension: global_tax_calculation {
    type: string
    sql: ${TABLE}.global_tax_calculation ;;
  }
  dimension: home_balance {
    type: number
    sql: ${TABLE}.home_balance ;;
  }
  dimension: home_total_amount {
    type: number
    sql: ${TABLE}.home_total_amount ;;
  }
  dimension: print_status {
    type: string
    sql: ${TABLE}.print_status ;;
  }
  dimension: private_note {
    type: string
    sql: ${TABLE}.private_note ;;
  }
  dimension: sales_term_id {
    type: string
    sql: ${TABLE}.sales_term_id ;;
  }
  dimension_group: ship {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ship_date ;;
  }
  dimension: shipping_address_id {
    type: string
    sql: ${TABLE}.shipping_address_id ;;
  }
  dimension: sync_token {
    type: string
    sql: ${TABLE}.sync_token ;;
  }
  dimension: tax_code_id {
    type: string
    sql: ${TABLE}.tax_code_id ;;
  }
  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }
  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }
  dimension: tracking_number {
    type: string
    sql: ${TABLE}.tracking_number ;;
  }
  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_date ;;
  }
  dimension: transaction_source {
    type: string
    sql: ${TABLE}.transaction_source ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: tot_amount {
    type: sum
    sql: ${total_amount} ;;
    drill_fields: [id]
  }

}
