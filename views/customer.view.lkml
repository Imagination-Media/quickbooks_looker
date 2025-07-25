view: customer {
  sql_table_name: `imagination-media-324201.quickbooks.customer` ;;
  drill_fields: [parent_customer_id]

  dimension: parent_customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.parent_customer_id ;;
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
  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }
  dimension: alternate_phone_number {
    type: string
    sql: ${TABLE}.alternate_phone_number ;;
  }
  dimension: ar_account_id {
    type: string
    sql: ${TABLE}.ar_account_id ;;
  }
  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }
  dimension: balance_with_jobs {
    type: number
    sql: ${TABLE}.balance_with_jobs ;;
  }
  dimension: bill_address_id {
    type: string
    sql: ${TABLE}.bill_address_id ;;
  }
  dimension: bill_with_parent {
    type: yesno
    sql: ${TABLE}.bill_with_parent ;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
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
  dimension: customer_type_id {
    type: string
    sql: ${TABLE}.customer_type_id ;;
  }
  dimension: default_tax_code_id {
    type: string
    sql: ${TABLE}.default_tax_code_id ;;
  }
  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: family_name {
    type: string
    sql: ${TABLE}.family_name ;;
  }
  dimension: fax_number {
    type: string
    sql: ${TABLE}.fax_number ;;
  }
  dimension: fully_qualified_name {
    type: string
    sql: ${TABLE}.fully_qualified_name ;;
  }
  dimension: given_name {
    type: string
    sql: ${TABLE}.given_name ;;
  }
  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: job {
    type: yesno
    sql: ${TABLE}.job ;;
  }
  dimension: level {
    type: number
    sql: ${TABLE}.level ;;
  }
  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }
  dimension: mobile_number {
    type: string
    sql: ${TABLE}.mobile_number ;;
  }
  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }
  dimension_group: open_balance {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.open_balance_date ;;
  }
  dimension: payment_method_id {
    type: string
    sql: ${TABLE}.payment_method_id ;;
  }
  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }
  dimension: preferred_delivery_method {
    type: string
    sql: ${TABLE}.preferred_delivery_method ;;
  }
  dimension: print_on_check_name {
    type: string
    sql: ${TABLE}.print_on_check_name ;;
  }
  dimension: resale_number {
    type: string
    sql: ${TABLE}.resale_number ;;
  }
  dimension: sales_term_id {
    type: string
    sql: ${TABLE}.sales_term_id ;;
  }
  dimension: shipping_address_id {
    type: string
    sql: ${TABLE}.shipping_address_id ;;
  }
  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }
  dimension: sync_token {
    type: string
    sql: ${TABLE}.sync_token ;;
  }
  dimension: tax_exemption_reason_id {
    type: string
    sql: ${TABLE}.tax_exemption_reason_id ;;
  }
  dimension: taxable {
    type: yesno
    sql: ${TABLE}.taxable ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }
  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	parent_customer_id,
	print_on_check_name,
	fully_qualified_name,
	display_name,
	given_name,
	middle_name,
	company_name,
	family_name
	]
  }

}
