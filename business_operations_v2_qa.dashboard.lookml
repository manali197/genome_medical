- dashboard: business_operations_v2_qa
  title: Business Operations v2 (QA)
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Completed Encounter Trends - Monthly (Last 6 Months)
    name: Completed Encounter Trends - Monthly (Last 6 Months)
    model: genome
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
    legend_position: center
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 8
    col: 12
    width: 12
    height: 7
  - title: Completed Encounter Trends - Weekly
    name: Completed Encounter Trends - Weekly
    model: genome
    explore: completed_encounters
    type: looker_line
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_completed_encounters]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 8 weeks
    sorts: [completed_encounters.date_of_service_week desc]
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
    col: 12
    width: 12
    height: 7
  - title: Completed Encounter - Quarterly Trend (Last 4 Quarters)
    name: Completed Encounter - Quarterly Trend (Last 4 Quarters)
    model: genome
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: after 2019/01/01
    sorts: [completed_encounters.date_of_service_quarter desc, completed_encounters.referral_channel]
    limit: 4
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
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
    row: 8
    col: 0
    width: 12
    height: 7
  - title: New Patients Trends - Quarterly (Last 4 Quarters)
    name: New Patients Trends - Quarterly (Last 4 Quarters)
    model: genome
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_new_patients]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: 4 quarters
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
    legend_position: center
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 26
    col: 0
    width: 12
    height: 7
  - title: New Patients Trends - Monthly (Last 6 Months)
    name: New Patients Trends - Monthly (Last 6 Months)
    model: genome
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
    legend_position: center
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
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
    height: 7
  - title: New Patients Trends - Weekly
    name: New Patients Trends - Weekly
    model: genome
    explore: completed_encounters
    type: looker_line
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_new_patients]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 8 weeks
    sorts: [completed_encounters.date_of_service_week desc]
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
    row: 33
    col: 12
    width: 12
    height: 7
  - title: All-Time Completed Encounters (2018 - 2021)
    name: All-Time Completed Encounters (2018 - 2021)
    model: genome
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
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 2
    col: 0
    width: 12
    height: 2
  - title: Total Completed Encounters in Feb 2021
    name: Total Completed Encounters in Feb 2021
    model: genome
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 2021/02/01 to 2021/02/18
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
    row: 6
    col: 12
    width: 6
    height: 2
  - title: Total Completed Encounters in 2021
    name: Total Completed Encounters in 2021
    model: genome
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.date_of_service_year: '2021'
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
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 6
    col: 0
    width: 12
    height: 2
  - title: 2021 Completed Encounters by Referral Program
    name: 2021 Completed Encounters by Referral Program
    model: genome
    explore: completed_encounters
    type: looker_pie
    fields: [completed_encounters.referral_program, completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 10
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: 4dadd4d2-40af-451b-bcdd-1dfaedf76163
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Referral Programs in 2021 to-date
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 15
    col: 0
    width: 6
    height: 7
  - title: Avg Encounters Per Day in Feb 2021
    name: Avg Encounters Per Day in Feb 2021
    model: genome
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 2021/02/01 to 2021/02/18
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
    note_text: For Current Month
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 6
    col: 18
    width: 6
    height: 2
  - title: New Patients Seen in 2021 by US State
    name: New Patients Seen in 2021 by US State
    model: genome
    explore: completed_encounters
    type: looker_map
    fields: [completed_encounters.patient_state, completed_encounters.count_new_patients]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_new_patients desc]
    limit: 500
    column_limit: 50
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
    show_view_names: false
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
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 33
    col: 0
    width: 12
    height: 7
  - name: All-Time New Patients Seen (2018 - 2021)
    title: All-Time New Patients Seen (2018 - 2021)
    model: genome
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
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 2
    col: 12
    width: 12
    height: 2
  - name: Total New Patients Seen in 2021
    title: Total New Patients Seen in 2021
    model: genome
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
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 24
    col: 0
    width: 12
    height: 2
  - title: Monthly Average New Patients per Business Day
    name: Monthly Average New Patients per Business Day
    model: genome
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.count_new_patients, completed_encounters.date_of_service_day_of_week,
      completed_encounters.date_of_service_month]
    pivots: [completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_day_of_week, completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 12 months
    sorts: [completed_encounters.count_new_patients desc 0, completed_encounters.date_of_service_day_of_week,
      completed_encounters.date_of_service_month]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{table_calculation: average_monthly_new_patients, label: Average
          Monthly New Patients, expression: 'mean(pivot_row(${completed_encounters.count_new_patients}))

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: false}]
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
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: [completed_encounters.count_new_patients]
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 42
    col: 0
    width: 8
    height: 7
  - title: Monthly Average Completed Encounters per Business Day (copy)
    name: Monthly Average Completed Encounters per Business Day (copy)
    model: genome
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_month, completed_encounters.count_completed_encounters,
      completed_encounters.referral_partner]
    pivots: [completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 4 months
    sorts: [completed_encounters.date_of_service_month 0, completed_encounters.count_completed_encounters
        desc 3]
    limit: 10
    column_limit: 50
    dynamic_fields: [{table_calculation: average_new_patients, label: Average New
          Patients, expression: 'mean(pivot_row(${completed_encounters.count_new_patients}))

          ', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: number}, {table_calculation: average_completed_encounters,
        label: Average Completed Encounters, expression: 'mean(pivot_row(${completed_encounters.count_completed_encounters}))

          ', value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}]
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
    legend_position: right
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
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: 5196a570-95f8-4337-859e-97bf8af31443
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields:
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 42
    col: 8
    width: 16
    height: 7
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
  - name: NOT INCLUDED / WIP
    type: text
    title_text: NOT INCLUDED / WIP
    row: 40
    col: 0
    width: 24
    height: 2
  - title: Total New Patients Seen in Current Month
    name: Total New Patients Seen in Current Month
    model: genome
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters, completed_encounters.date_of_service_month,
      completed_encounters.count_new_patients]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 2021/02/01 to 2021/02/18
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
    note_text: For Current Month
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 24
    col: 12
    width: 12
    height: 2
  - title: 2021 Completed Encounters by Referral Channel
    name: 2021 Completed Encounters by Referral Channel
    model: genome
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    series_colors:
      Labs: "#10C871"
      QA: "#AEC8C1"
      Consumer/SelfReferral: "#FCCF41"
      Physician: "#9E7FD0"
      Employer: "#7CC8FA"
      Health Systems: "#f56776"
      Pharma/Research: "#FD9577"
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
    col: 6
    width: 6
    height: 7
  - name: ALL TIME METRICS
    type: text
    title_text: ALL TIME METRICS
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Completed Encounter Trends - Weekly (copy)
    name: Completed Encounter Trends - Weekly (copy)
    model: genome
    explore: completed_encounters
    type: looker_line
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_completed_encounters,
      completed_encounters.referral_channel]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 8 weeks
    sorts: [completed_encounters.date_of_service_week desc, completed_encounters.referral_channel]
    limit: 5000
    row_total: right
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
    value_labels: legend
    label_type: labPer
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 49
    col: 0
    width: 12
    height: 7
  - title: Monthly Average Completed Encounters per Business Day (copy 2)
    name: Monthly Average Completed Encounters per Business Day (copy 2)
    model: genome
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_month, completed_encounters.count_completed_encounters,
      completed_encounters.referral_partner]
    pivots: [completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 4 months
    sorts: [completed_encounters.date_of_service_month 0, completed_encounters.count_completed_encounters
        desc 3]
    limit: 10
    column_limit: 50
    dynamic_fields: [{table_calculation: average_new_patients, label: Average New
          Patients, expression: 'mean(pivot_row(${completed_encounters.count_new_patients}))

          ', value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: number}, {table_calculation: average_completed_encounters,
        label: Average Completed Encounters, expression: 'mean(pivot_row(${completed_encounters.count_completed_encounters}))

          ', value_format: !!null '', value_format_name: !!null '', is_disabled: false,
        _kind_hint: supermeasure, _type_hint: number}]
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
    legend_position: right
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
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: 5196a570-95f8-4337-859e-97bf8af31443
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields:
    listen:
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 56
    col: 0
    width: 12
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
    model: genome
    explore: completed_encounters
    listens_to_filters: []
    field: completed_encounters.referral_program
  - name: Referral Channel
    title: Referral Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: genome
    explore: completed_encounters
    listens_to_filters: []
    field: completed_encounters.referral_channel
