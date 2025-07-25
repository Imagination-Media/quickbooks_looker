- dashboard: profit_and_loss
  title: Profit and Loss
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: SUYgIv9zCxQABTloQ4sGYb
  elements:
  - title: Rev & Exp - Rolling 12 months
    name: Rev & Exp - Rolling 12 months
    model: main
    explore: quickbooks__profit_and_loss
    type: looker_line
    fields: [quickbooks__profit_and_loss.calendar_month, quickbooks__profit_and_loss.account_class,
      quickbooks__profit_and_loss.total_amount]
    pivots: [quickbooks__profit_and_loss.account_class]
    fill_fields: [quickbooks__profit_and_loss.calendar_month]
    filters:
      quickbooks__profit_and_loss.calendar_month: 12 month ago for 12 month
    sorts: [quickbooks__profit_and_loss.account_class desc, quickbooks__profit_and_loss.calendar_month
        desc]
    limit: 500
    column_limit: 50
    total: true
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
    show_row_numbers: false
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
    defaults_version: 1
    hidden_pivots: {}
    minimum_column_width: 50
    show_sql_query_menu_options: false
    column_order: [quickbooks__profit_and_loss.calendar_month, quickbooks__profit_and_loss.account_type,
      quickbooks__profit_and_loss.parent_account_name, quickbooks__profit_and_loss.account_name,
      quickbooks__profit_and_loss.account_sub_type, quickbooks__profit_and_loss.account_number,
      quickbooks__profit_and_loss.account_ordinal, quickbooks__profit_and_loss.class_id,
      quickbooks__profit_and_loss.is_sub_account, quickbooks__profit_and_loss.source_relation,
      Revenue_quickbooks__profit_and_loss.total_amount, Expense_quickbooks__profit_and_loss.total_amount]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      quickbooks__profit_and_loss.calendar_month: 100.32999999999993
      Expense_quickbooks__profit_and_loss.total_amount: 163
      Revenue_quickbooks__profit_and_loss.total_amount: 153
    series_cell_visualizations:
      quickbooks__profit_and_loss.total_amount:
        is_active: false
    hidden_fields:
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 10
  - title: P&L Detail - Last Complete Month
    name: P&L Detail - Last Complete Month
    model: main
    explore: quickbooks__profit_and_loss
    type: looker_grid
    fields: [quickbooks__profit_and_loss.calendar_month, quickbooks__profit_and_loss.account_class,
      quickbooks__profit_and_loss.account_type, quickbooks__profit_and_loss.parent_account_name,
      quickbooks__profit_and_loss.account_name, quickbooks__profit_and_loss.account_sub_type,
      quickbooks__profit_and_loss.account_number, quickbooks__profit_and_loss.account_ordinal,
      quickbooks__profit_and_loss.class_id, quickbooks__profit_and_loss.is_sub_account,
      quickbooks__profit_and_loss.source_relation, quickbooks__profit_and_loss.total_amount]
    pivots: [quickbooks__profit_and_loss.account_class]
    filters:
      quickbooks__profit_and_loss.calendar_month: 1 month ago for 1 month
    sorts: [quickbooks__profit_and_loss.account_class desc, quickbooks__profit_and_loss.parent_account_name,
      quickbooks__profit_and_loss.account_name]
    limit: 500
    column_limit: 50
    total: true
    show_view_names: false
    show_row_numbers: false
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
    defaults_version: 1
    hidden_pivots: {}
    minimum_column_width: 50
    show_sql_query_menu_options: false
    column_order: [quickbooks__profit_and_loss.calendar_month, quickbooks__profit_and_loss.account_type,
      quickbooks__profit_and_loss.parent_account_name, quickbooks__profit_and_loss.account_name,
      quickbooks__profit_and_loss.account_sub_type, quickbooks__profit_and_loss.account_number,
      quickbooks__profit_and_loss.account_ordinal, quickbooks__profit_and_loss.class_id,
      quickbooks__profit_and_loss.is_sub_account, quickbooks__profit_and_loss.source_relation,
      Revenue_quickbooks__profit_and_loss.total_amount, Expense_quickbooks__profit_and_loss.total_amount]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      quickbooks__profit_and_loss.is_sub_account: 82
      quickbooks__profit_and_loss.class_id: 70
      quickbooks__profit_and_loss.account_ordinal: 98
      quickbooks__profit_and_loss.account_number: 143
      quickbooks__profit_and_loss.calendar_month: 100.32999999999993
      quickbooks__profit_and_loss.source_relation: 50
      Expense_quickbooks__profit_and_loss.total_amount: 163
      Revenue_quickbooks__profit_and_loss.total_amount: 153
      quickbooks__profit_and_loss.account_name: 198
      quickbooks__profit_and_loss.parent_account_name: 187
      quickbooks__profit_and_loss.account_type: 186.32999999999993
      quickbooks__profit_and_loss.account_sub_type: 390
    series_cell_visualizations:
      quickbooks__profit_and_loss.total_amount:
        is_active: false
    hidden_fields: [quickbooks__profit_and_loss.account_number, quickbooks__profit_and_loss.calendar_month,
      quickbooks__profit_and_loss.source_relation]
    listen: {}
    row: 10
    col: 0
    width: 24
    height: 18
