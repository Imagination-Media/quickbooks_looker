- dashboard: cash_flow
  title: Cash Flow
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 31Dmm9YnMYKFZuE5uQHsuh
  elements:
  - title: Cash FLow - Last Complete Month
    name: Cash FLow - Last Complete Month
    model: main
    explore: quickbooks__cash_flow_statement
    type: looker_grid
    fields: [quickbooks__cash_flow_statement.cash_flow_period_month, quickbooks__cash_flow_statement.account_name,
      quickbooks__cash_flow_statement.account_sub_type, quickbooks__cash_flow_statement.account_type,
      quickbooks__cash_flow_statement.cash_flow_ordinal, quickbooks__cash_flow_statement.cash_flow_type,
      quickbooks__cash_flow_statement.total_cash_beginning_period, quickbooks__cash_flow_statement.total_cash_ending_period,
      quickbooks__cash_flow_statement.total_cash_net_period]
    filters: {}
    sorts: [quickbooks__cash_flow_statement.cash_flow_period_month desc]
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
      quickbooks__cash_flow_statement.total_cash_beginning_period:
        is_active: false
    hidden_pivots: {}
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Cash Flow Period Month: quickbooks__cash_flow_statement.cash_flow_period_month
    row: 0
    col: 0
    width: 24
    height: 19
  filters:
  - name: Cash Flow Period Month
    title: Cash Flow Period Month
    type: field_filter
    default_value: 1 month ago for 1 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: main
    explore: quickbooks__cash_flow_statement
    listens_to_filters: []
    field: quickbooks__cash_flow_statement.cash_flow_period_month
