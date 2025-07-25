- dashboard: balance_sheet
  title: Balance Sheet
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ZVUfLnV4auLkedB9HzVj74
  elements:
  - title: Accounts - Last Complete Month
    name: Accounts - Last Complete Month
    model: main
    explore: quickbooks__balance_sheet
    type: looker_grid
    fields: [quickbooks__balance_sheet.account_class, quickbooks__balance_sheet.account_name,
      quickbooks__balance_sheet.account_sub_type, quickbooks__balance_sheet.account_type,
      quickbooks__balance_sheet.total_amount, quickbooks__balance_sheet.account_ordinal]
    filters:
      quickbooks__balance_sheet.calendar_month: 1 month ago for 1 month
    sorts: [quickbooks__balance_sheet.total_amount desc 0]
    limit: 500
    column_limit: 50
    total: true
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Accounts - Last Complete Month (ordinal investigation)
    name: Accounts - Last Complete Month (ordinal investigation)
    model: main
    explore: quickbooks__balance_sheet
    type: looker_grid
    fields: [quickbooks__balance_sheet.account_class, quickbooks__balance_sheet.account_name,
      quickbooks__balance_sheet.account_sub_type, quickbooks__balance_sheet.account_type,
      quickbooks__balance_sheet.total_amount, quickbooks__balance_sheet.account_ordinal]
    filters:
      quickbooks__balance_sheet.calendar_month: 1 month ago for 1 month
    sorts: [quickbooks__balance_sheet.total_amount desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: |-
        case(when(${quickbooks__balance_sheet.account_ordinal}=2 AND ${quickbooks__balance_sheet.total_amount}>0,(${quickbooks__balance_sheet.total_amount}* -1)),
          when(${quickbooks__balance_sheet.account_ordinal}=2 AND ${quickbooks__balance_sheet.total_amount}<0,(${quickbooks__balance_sheet.total_amount})),
        ${quickbooks__balance_sheet.total_amount})
      label: test_amount
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: test_amount
      _type_hint: number
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
    series_labels:
      test_amount: Total Amount
    series_cell_visualizations:
      quickbooks__balance_sheet.total_amount:
        is_active: true
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
    listen: {}
    row: 0
    col: 8
    width: 14
    height: 6
