- dashboard: ar_and_ap
  title: A/R & A/P
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 3LRGtvOZVma5JtnOimNsG3
  elements:
  - title: Overdue Accounts
    name: Overdue Accounts
    model: quickbooks
    explore: quickbooks__ap_ar_enhanced
    type: looker_grid
    fields: [quickbooks__ap_ar_enhanced.customer_vendor_name, quickbooks__ap_ar_enhanced.days_overdue,
      quickbooks__ap_ar_enhanced.delivery_type, quickbooks__ap_ar_enhanced.initial_payment_date,
      quickbooks__ap_ar_enhanced.recent_payment_date, quickbooks__ap_ar_enhanced.due_date,
      quickbooks__ap_ar_enhanced.total_amount, quickbooks__ap_ar_enhanced.total_current_balance,
      quickbooks__ap_ar_enhanced.total_current_payment, quickbooks__ap_ar_enhanced.total_customer_vendor_balance]
    filters:
      quickbooks__ap_ar_enhanced.days_overdue: ">0"
    sorts: [quickbooks__ap_ar_enhanced.initial_payment_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      quickbooks__ap_ar_enhanced.total_amount:
        is_active: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    row: 0
    col: 0
    width: 20
    height: 7
