- dashboard: business_operations_v2_prod
  title: Business Operations v2 (Prod)
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Completed Encounter Trends - Monthly (Last 6 Months)
    name: Completed Encounter Trends - Monthly (Last 6 Months)
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_month, completed_encounters.referral_channel,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 6 months
    sorts: [completed_encounters.referral_channel, completed_encounters.date_of_service_month
        desc]
    limit: 5000
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 10
    col: 12
    width: 12
    height: 5
  - title: Completed Encounter Trends - Weekly
    name: Completed Encounter Trends - Weekly
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_line
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_completed_encounters]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 8 weeks
    sorts: [completed_encounters.date_of_service_week desc]
    limit: 5000
    x_axis_gridlines: true
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 15
    col: 16
    width: 8
    height: 7
  - title: Completed Encounter - Quarterly Trend (Last 5 Quarters)
    name: Completed Encounter - Quarterly Trend (Last 5 Quarters)
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: 5 quarters
    sorts: [completed_encounters.date_of_service_quarter desc, completed_encounters.referral_channel]
    limit: 5
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    note_state: collapsed
    note_display: above
    note_text: ''
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 10
    col: 0
    width: 12
    height: 5
  - title: New Patients Trends - Quarterly (Last 5 Quarters)
    name: New Patients Trends - Quarterly (Last 5 Quarters)
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_new_patients]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: 5 quarters
    sorts: [completed_encounters.date_of_service_quarter desc, completed_encounters.referral_channel]
    limit: 5000
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
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 24
    col: 0
    width: 12
    height: 6
  - title: New Patients Trends - Monthly (Last 6 Months)
    name: New Patients Trends - Monthly (Last 6 Months)
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_month, completed_encounters.referral_channel,
      completed_encounters.count_new_patients]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 6 months
    sorts: [completed_encounters.referral_channel, completed_encounters.date_of_service_month
        desc]
    limit: 5000
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 26
    col: 12
    width: 12
    height: 6
  - title: New Patients Trends - Weekly
    name: New Patients Trends - Weekly
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_line
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_new_patients]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 8 weeks
    sorts: [completed_encounters.date_of_service_week desc]
    limit: 5000
    x_axis_gridlines: true
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 32
    col: 12
    width: 12
    height: 6
  - title: All-Time Completed Encounters (2018 - 2021)
    name: All-Time Completed Encounters (2018 - 2021)
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#592EC2"
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 2
    col: 0
    width: 12
    height: 2
  - title: Total Completed Encounters - MTD
    name: Total Completed Encounters - MTD
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_month]
    pivots: [completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 2 months
      completed_encounters.is_before_mtd: 'Yes'
    sorts: [completed_encounters.date_of_service_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: variance, label: Variance, expression: 'pivot_index(${completed_encounters.count_completed_encounters},1)
          - pivot_index(${completed_encounters.count_completed_encounters},2)', value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: supermeasure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    comparison_label: Encounters vs Previous MTD
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Current Day of Month vs Current Day of Past Month
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 6
    col: 8
    width: 8
    height: 4
  - title: Total Completed Encounters - YTD
    name: Total Completed Encounters - YTD
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_year]
    fill_fields: [completed_encounters.date_of_service_year]
    filters:
      completed_encounters.date_of_service_year: 1 years
    sorts: [completed_encounters.date_of_service_year desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    comparison_label: Encounters vs Previous YTD
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 6
    col: 0
    width: 8
    height: 4
  - title: 2021 Completed Encounters by Referral Program
    name: 2021 Completed Encounters by Referral Program
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_pie
    fields: [completed_encounters.referral_program, completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 11
    total: true
    dynamic_fields: [{table_calculation: encounters_count_with_other, label: Encounters
          Count with Other, expression: "if(\n# For rows other than the last row\n\
          \ row() != max(row()) \n# Display event count\n ,${completed_encounters.count_completed_encounters}\n\
          # For the last row, display total event count from all rows above this one\n\
          \ , ${completed_encounters.count_completed_encounters:total} - sum( if(row()=\
          \ max(row()) , 0 , ${completed_encounters.count_completed_encounters}) )\n\
          )", value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}, {table_calculation: referral_program_with_other, label: Referral
          Program with Other, expression: "if(\n# For rows other than the last row\n\
          \ row() != max(row()) \n# Display event name\n ,${completed_encounters.referral_program}\n\
          # For the last row, display \"Other\"\n , \"Other\"\n)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: a0f97728-49ea-4123-b57e-ec4c57803f8b
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Referral Programs in 2021 to-date
    hidden_fields: [completed_encounters.count_completed_encounters, completed_encounters.referral_program]
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 15
    col: 0
    width: 8
    height: 7
  - title: Avg Encounters Per Day - MTD
    name: Avg Encounters Per Day - MTD
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 1 months
    sorts: [completed_encounters.date_of_service_month]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: encounter_rate_per_day,
        _type_hint: number, category: table_calculation, expression: 'round(mean(${completed_encounters.count_completed_encounters}
          / ${days_in_date_of_service_month}), 2)', label: Encounter rate per day,
        value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: dimension,
        table_calculation: days_in_date_of_service_month, _type_hint: number, category: table_calculation,
        expression: extract_days(now()), label: Days in Date-of-Service Month, value_format: !!null '',
        value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    comparison_label: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: ''
    hidden_fields: [completed_encounters.count_completed_encounters]
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 6
    col: 16
    width: 8
    height: 2
  - title: New Patients Seen in 2021 by US State
    name: New Patients Seen in 2021 by US State
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_grid
    fields: [completed_encounters.patient_state, completed_encounters.count_new_patients]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_new_patients desc]
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
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      completed_encounters.count_new_patients:
        is_active: true
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 51.6180165487737
    map_longitude: -123.92578125000001
    map_zoom: 2
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
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 32
    col: 0
    width: 12
    height: 6
  - title: All-Time New Patients Seen (2018 - 2021)
    name: All-Time New Patients Seen (2018 - 2021)
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_new_patients]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    custom_color: "#2a62d1"
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
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 2
    col: 12
    width: 12
    height: 2
  - title: Total New Patients Seen - YTD
    name: Total New Patients Seen - YTD
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_new_patients]
    filters:
      completed_encounters.date_of_service_year: '2021'
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: definition of Total New Patients Seen
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 30
    col: 0
    width: 12
    height: 2
  - name: NEW PATIENTS SEEN
    type: text
    title_text: NEW PATIENTS SEEN
    subtitle_text: For Current Year
    row: 22
    col: 0
    width: 24
    height: 2
  - name: COMPLETED ENCOUNTERS
    type: text
    title_text: COMPLETED ENCOUNTERS
    subtitle_text: For Current Year
    row: 4
    col: 0
    width: 24
    height: 2
  - title: Total New Patients Seen - MTD
    name: Total New Patients Seen - MTD
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.date_of_service_month, completed_encounters.count_new_patients]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 1 months
    sorts: [completed_encounters.date_of_service_month]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    comparison_label: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: ''
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 24
    col: 12
    width: 12
    height: 2
  - title: 2021 Completed Encounters by Referral Channel
    name: 2021 Completed Encounters by Referral Channel
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_pie
    fields: [completed_encounters.count_completed_encounters, completed_encounters.referral_channel]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 10
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    series_colors:
      Labs: "#592EC2"
      QA: "#FFD95F"
      Consumer/SelfReferral: "#3EB0D5"
      Physician: "#72D16D"
      Employer: "#B1399E"
      Health Systems: "#C2DD67"
      Pharma/Research: "#4276BE"
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: 2021 Encounters to-date
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
    show_null_points: true
    interpolation: linear
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    font_size: 12
    up_color: "#FCCF41"
    down_color: "#7CC8FA"
    total_color: "#f56776"
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 15
    col: 8
    width: 8
    height: 7
  - name: ALL TIME METRICS
    type: text
    title_text: ALL TIME METRICS
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Avg Encounters Per Day - Previous Month
    name: Avg Encounters Per Day - Previous Month
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.referral_program: ''
      completed_encounters.referral_channel: ''
    sorts: [completed_encounters.date_of_service_month]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: average_daily_encounters_per_month,
        _type_hint: number, category: table_calculation, expression: 'round(mean(${completed_encounters.count_completed_encounters}
          / ${days_in_date_of_service_month}), 2)', label: Average Daily Encounters
          per Month, value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: dimension,
        table_calculation: days_in_date_of_service_month, _type_hint: number, category: table_calculation,
        expression: 'extract_days(add_days(-1, date(extract_years(add_months(1, ${completed_encounters.date_of_service_month})),
          extract_months(add_months(1, ${completed_encounters.date_of_service_month})),
          1)))', label: Days in Date-of-Service Month, value_format: !!null '', value_format_name: !!null ''}]
    filter_expression: extract_months(${completed_encounters.date_of_service_month})
      = extract_months(add_months(-1, now())) AND extract_years(${completed_encounters.date_of_service_year})
      = extract_years(now())
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    comparison_label: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: ''
    hidden_fields: [completed_encounters.count_completed_encounters, days_in_date_of_service_month]
    listen: {}
    row: 8
    col: 16
    width: 8
    height: 2
  - name: 'DEFINITION: Encounter'
    type: text
    title_text: 'DEFINITION: Encounter'
    subtitle_text: ''
    body_text: "**An ENCOUNTER is defined as an interaction between a patient and\
      \ Genome Medical healthcare provider(s)/or services for the purpose of improving\
      \ healthcare or assessing the health status of\_patient.** \n\nThe encounter\
      \ serves as a focal point linking clinical, administrative and financial information\
      \ (assets)."
    row: 38
    col: 0
    width: 6
    height: 7
  - name: 'DEFINITION: Completed Encounter'
    type: text
    title_text: 'DEFINITION: Completed Encounter'
    body_text: "**A\_COMPLETED encounter\_means that the service(s) provided have\
      \ been completed, indicated by the Date Of Service (date).** \n\nDifferent types\
      \ of encounters have different definitions of “completed”:\n\n- Visit encounter\
      \ —> Patient has completed the Genetic Counselor visit session.\n- Lab/TRO encounter\
      \ —> Genome Medical has reviewed and authorized (either approved or rejected)\
      \ the patient initiated test order request.\n- Group Session —> Patient has\
      \ attended a webinar or watched the Specialty Care Pathways (SCP) —> Patient\
      \ has completed the entire education module."
    row: 38
    col: 6
    width: 9
    height: 7
  - name: 'DEFINITION: New Patient Seen'
    type: text
    title_text: 'DEFINITION: New Patient Seen'
    body_text: "**A NEW PATIENT SEEN is seen in a certain date range, means that a\
      \ patient has COMPLETED their FIRST encounter in the specific date range.**\
      \ \n\n_If a patient registers in Jan, and completes their first visit in Feb\
      \ and another in March, they will be counted as a new patient seen for Feb ONLY._\_\
      \n\nAdditional Considerations:\n- Patients are NOT double counted. These are\
      \ unique patient counts, an individual can only be counted ONCE as a New Patient\
      \ Seen. \n- If a registered patient has cancelled their appointment, or the\
      \ visit has been scheduled and has not occurred or completed yet (I.e. we still\
      \ haven’t provided service to this patient), they will NOT be counted as new\
      \ patient seen until their first encounter has completed.\n- New patient seen\
      \ is NOT the same as newly registered patients."
    row: 38
    col: 15
    width: 9
    height: 7
  filters:
  - name: Referral Program
    title: Referral Program
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: biz_ops_prod
    explore: completed_encounters
    listens_to_filters: []
    field: completed_encounters.referral_program
  - name: Referral Channel
    title: Referral Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: biz_ops_prod
    explore: completed_encounters
    listens_to_filters: []
    field: completed_encounters.referral_channel
