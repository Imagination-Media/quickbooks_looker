- dashboard: general_ledger
  title: General Ledger
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: A9uaDdiSGkLcDdao3oZAQR
  elements:
  - title: General Ledger
    name: General Ledger
    model: main
    explore: quickbooks__general_ledger
    type: looker_grid
    fields: [quickbooks__general_ledger.account_name, quickbooks__general_ledger.financial_statement_helper,
      quickbooks__general_ledger.total_adjusted_amount, quickbooks__general_ledger.total_amount,
      quickbooks__general_ledger.total_account_current_balance]
    filters: {}
    sorts: [quickbooks__general_ledger.total_adjusted_amount desc]
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
      quickbooks__general_ledger.total_adjusted_amount:
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
    listen:
      Transaction Month: quickbooks__general_ledger.transaction_month
    row: 0
    col: 0
    width: 18
    height: 10
  - title: AR & AP - R12 Months
    name: AR & AP - R12 Months
    model: main
    explore: quickbooks__general_ledger_by_period
    type: looker_line
    fields: [quickbooks__general_ledger_by_period.period_first_day_month, quickbooks__general_ledger_by_period.account_name,
      quickbooks__general_ledger_by_period.total_period_beginning_balance, quickbooks__general_ledger_by_period.total_period_ending_balance,
      quickbooks__general_ledger_by_period.total_period_net_change]
    pivots: [quickbooks__general_ledger_by_period.account_name]
    fill_fields: [quickbooks__general_ledger_by_period.period_first_day_month]
    filters:
      quickbooks__general_ledger_by_period.account_name: Accounts Payable (A/P),Accounts
        Receivable (A/R)
      quickbooks__general_ledger_by_period.period_first_day_month: 12 month ago for
        12 month
    sorts: [quickbooks__general_ledger_by_period.account_name, quickbooks__general_ledger_by_period.period_first_day_month
        desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_fields: [quickbooks__general_ledger_by_period.total_period_beginning_balance,
      quickbooks__general_ledger_by_period.total_period_net_change]
    defaults_version: 1
    hidden_pivots: {}
    listen: {}
    row: 10
    col: 0
    width: 18
    height: 6
  filters:
  - name: Transaction Month
    title: Transaction Month
    type: field_filter
    default_value: 1 month ago for 1 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: main
    explore: quickbooks__general_ledger
    listens_to_filters: []
    field: quickbooks__general_ledger.transaction_month
