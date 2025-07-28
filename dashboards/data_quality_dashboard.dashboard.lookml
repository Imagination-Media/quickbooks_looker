- dashboard: data_quality_dashboard
  title: Data Quality Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Comprehensive data quality monitoring for Quickbooks data including primary key validation, referential integrity checks, and data consistency validation"

  elements:
  - title: Data Quality Overview
    name: data_quality_overview
    model: quickbooks
    explore: primary_key_validation
    type: single_value
    fields: [primary_key_validation.pass_rate_percentage]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 95, background_color: "#1f7a1f",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: between, value: [80, 95],
        background_color: "#e6b800", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 80, background_color: "#cc0000",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6

  - title: Primary Key Validation Results
    name: primary_key_validation_results
    model: quickbooks
    explore: primary_key_validation
    type: looker_grid
    fields: [primary_key_validation.table_name, primary_key_validation.primary_key_field,
      primary_key_validation.total_records, primary_key_validation.unique_records,
      primary_key_validation.duplicate_count, primary_key_validation.test_result]
    sorts: [primary_key_validation.test_result desc, primary_key_validation.table_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      primary_key_validation.table_name: Table Name
      primary_key_validation.primary_key_field: Primary Key Field
      primary_key_validation.total_records: Total Records
      primary_key_validation.unique_records: Unique Records
      primary_key_validation.duplicate_count: Duplicate Count
      primary_key_validation.test_result: Test Result
    series_column_widths:
      primary_key_validation.table_name: 200
      primary_key_validation.primary_key_field: 150
      primary_key_validation.test_result: 100
    series_cell_visualizations:
      primary_key_validation.duplicate_count:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [primary_key_validation.test_result]}, {type: equal to,
        value: PASS, background_color: "#1f7a1f", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab},
        bold: false, italic: false, strikethrough: false, fields: [primary_key_validation.test_result]},
      {type: equal to, value: FAIL, background_color: "#cc0000", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [primary_key_validation.test_result]}]
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
    series_types: {}
    row: 0
    col: 8
    width: 16
    height: 6

  - title: Referential Integrity Validation Results
    name: referential_integrity_validation_results
    model: quickbooks
    explore: referential_integrity_validation
    type: looker_grid
    fields: [referential_integrity_validation.relationship_name, referential_integrity_validation.relationship_description,
      referential_integrity_validation.total_child_records, referential_integrity_validation.valid_references,
      referential_integrity_validation.orphaned_records, referential_integrity_validation.test_result]
    sorts: [referential_integrity_validation.test_result desc, referential_integrity_validation.relationship_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      referential_integrity_validation.relationship_name: Relationship
      referential_integrity_validation.relationship_description: Description
      referential_integrity_validation.total_child_records: Total Child Records
      referential_integrity_validation.valid_references: Valid References
      referential_integrity_validation.orphaned_records: Orphaned Records
      referential_integrity_validation.test_result: Test Result
    series_column_widths:
      referential_integrity_validation.relationship_name: 180
      referential_integrity_validation.relationship_description: 250
      referential_integrity_validation.test_result: 100
    series_cell_visualizations:
      referential_integrity_validation.orphaned_records:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    conditional_formatting: [{type: equal to, value: PASS, background_color: "#1f7a1f",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [referential_integrity_validation.test_result]},
      {type: equal to, value: FAIL, background_color: "#cc0000", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [referential_integrity_validation.test_result]}]
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
    series_types: {}
    row: 6
    col: 0
    width: 24
    height: 6

  - title: Data Consistency Validation Results
    name: data_consistency_validation_results
    model: quickbooks
    explore: data_consistency_validation
    type: looker_grid
    fields: [data_consistency_validation.test_name, data_consistency_validation.test_description,
      data_consistency_validation.total_records, data_consistency_validation.valid_records,
      data_consistency_validation.invalid_records, data_consistency_validation.validity_percentage,
      data_consistency_validation.test_result]
    sorts: [data_consistency_validation.test_result desc, data_consistency_validation.test_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      data_consistency_validation.test_name: Test Name
      data_consistency_validation.test_description: Description
      data_consistency_validation.total_records: Total Records
      data_consistency_validation.valid_records: Valid Records
      data_consistency_validation.invalid_records: Invalid Records
      data_consistency_validation.validity_percentage: Validity %
      data_consistency_validation.test_result: Test Result
    series_column_widths:
      data_consistency_validation.test_name: 200
      data_consistency_validation.test_description: 300
      data_consistency_validation.test_result: 100
    series_cell_visualizations:
      data_consistency_validation.invalid_records:
        is_active: true
        palette:
          palette_id: 85de97da-2ded-4dec-9dbd-e6a7d36d5825
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      data_consistency_validation.validity_percentage:
        is_active: true
        palette:
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
    conditional_formatting: [{type: equal to, value: PASS, background_color: "#1f7a1f",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [data_consistency_validation.test_result]},
      {type: equal to, value: FAIL, background_color: "#cc0000", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: [data_consistency_validation.test_result]}]
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
    series_types: {}
    row: 12
    col: 0
    width: 24
    height: 8

  - title: Data Quality Summary
    name: data_quality_summary
    model: quickbooks
    explore: primary_key_validation
    type: looker_column
    fields: [primary_key_validation.passed_tests, primary_key_validation.failed_tests]
    limit: 500
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}
    series_colors:
      primary_key_validation.passed_tests: "#1f7a1f"
      primary_key_validation.failed_tests: "#cc0000"
    defaults_version: 1
    row: 20
    col: 0
    width: 12
    height: 6
