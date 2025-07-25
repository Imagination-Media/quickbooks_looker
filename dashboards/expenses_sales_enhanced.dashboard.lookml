- dashboard: expenses_sales_enhanced
  title: Expenses Sales Enhanced
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: RBxXoQ43rcXMGVpGyogQzq
  elements:
  - title: Billable vs Non-Billable - R12 Months
    name: Billable vs Non-Billable - R12 Months
    model: quickbooks
    explore: quickbooks__expenses_sales_enhanced
    type: looker_column
    fields: [quickbooks__expenses_sales_enhanced.total_amount, quickbooks__expenses_sales_enhanced.billable_status,
      quickbooks__expenses_sales_enhanced.transaction_month]
    pivots: [quickbooks__expenses_sales_enhanced.billable_status]
    fill_fields: [quickbooks__expenses_sales_enhanced.transaction_month]
    filters:
      quickbooks__expenses_sales_enhanced.transaction_month: 12 month ago for 12 month
    sorts: [quickbooks__expenses_sales_enhanced.billable_status, quickbooks__expenses_sales_enhanced.total_amount
        desc 0]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      quickbooks__expenses_sales_enhanced.billable_status___null - quickbooks__expenses_sales_enhanced.total_amount: Billable
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
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
      quickbooks__expenses_sales_enhanced.total_amount:
        is_active: false
    defaults_version: 1
    series_column_widths:
      quickbooks__expenses_sales_enhanced.total_amount: 215
    listen: {}
    row: 0
    col: 0
    width: 21
    height: 18
  - title: Non-Billable Sales Expenses
    name: Non-Billable Sales Expenses
    model: quickbooks
    explore: quickbooks__expenses_sales_enhanced
    type: looker_grid
    fields: [quickbooks__expenses_sales_enhanced.description, quickbooks__expenses_sales_enhanced.item_quantity,
      quickbooks__expenses_sales_enhanced.item_unit_price, quickbooks__expenses_sales_enhanced.unit_amount,
      quickbooks__expenses_sales_enhanced.total_amount, quickbooks__expenses_sales_enhanced.vendor_name]
    filters:
      quickbooks__expenses_sales_enhanced.billable_status: NotBillable
    sorts: [quickbooks__expenses_sales_enhanced.total_amount desc 0]
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
      quickbooks__expenses_sales_enhanced.total_amount:
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
    listen:
      Transaction Month: quickbooks__expenses_sales_enhanced.transaction_month
    row: 18
    col: 0
    width: 22
    height: 8
  - title: Billable Sales Expenses
    name: Billable Sales Expenses
    model: quickbooks
    explore: quickbooks__expenses_sales_enhanced
    type: looker_grid
    fields: [quickbooks__expenses_sales_enhanced.customer_name, quickbooks__expenses_sales_enhanced.description,
      quickbooks__expenses_sales_enhanced.item_quantity, quickbooks__expenses_sales_enhanced.item_unit_price,
      quickbooks__expenses_sales_enhanced.unit_amount, quickbooks__expenses_sales_enhanced.total_amount,
      quickbooks__expenses_sales_enhanced.total_transaction_amount]
    filters:
      quickbooks__expenses_sales_enhanced.billable_status: "-NotBillable"
    sorts: [quickbooks__expenses_sales_enhanced.total_amount desc]
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
      quickbooks__expenses_sales_enhanced.total_amount:
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
    series_column_widths:
      quickbooks__expenses_sales_enhanced.item_unit_price: 145
      quickbooks__expenses_sales_enhanced.item_quantity: 139
      quickbooks__expenses_sales_enhanced.unit_amount: 112
      quickbooks__expenses_sales_enhanced.customer_name: 276.3299999999999
      quickbooks__expenses_sales_enhanced.description: 698
      quickbooks__expenses_sales_enhanced.total_amount: 215
    listen:
      Transaction Month: quickbooks__expenses_sales_enhanced.transaction_month
    row: 26
    col: 0
    width: 21
    height: 18
  - title: Billable Sales Expenses (Copy)
    name: Billable Sales Expenses (Copy)
    model: quickbooks
    explore: quickbooks__expenses_sales_enhanced
    type: looker_grid
    fields: [quickbooks__expenses_sales_enhanced.customer_name, quickbooks__expenses_sales_enhanced.description,
      quickbooks__expenses_sales_enhanced.item_quantity, quickbooks__expenses_sales_enhanced.item_unit_price,
      quickbooks__expenses_sales_enhanced.unit_amount, quickbooks__expenses_sales_enhanced.total_amount,
      quickbooks__expenses_sales_enhanced.total_transaction_amount]
    filters:
      quickbooks__expenses_sales_enhanced.billable_status: "-NotBillable"
    sorts: [quickbooks__expenses_sales_enhanced.total_amount desc]
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
      quickbooks__expenses_sales_enhanced.total_amount:
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
    series_column_widths:
      quickbooks__expenses_sales_enhanced.item_unit_price: 145
      quickbooks__expenses_sales_enhanced.item_quantity: 139
      quickbooks__expenses_sales_enhanced.unit_amount: 112
      quickbooks__expenses_sales_enhanced.customer_name: 276.3299999999999
      quickbooks__expenses_sales_enhanced.description: 698
      quickbooks__expenses_sales_enhanced.total_amount: 215
    listen:
      Transaction Month: quickbooks__expenses_sales_enhanced.transaction_month
    row: 44
    col: 0
    width: 21
    height: 18
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
    model: quickbooks
    explore: quickbooks__expenses_sales_enhanced
    listens_to_filters: []
    field: quickbooks__expenses_sales_enhanced.transaction_month
