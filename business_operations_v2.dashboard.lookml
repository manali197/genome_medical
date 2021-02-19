- dashboard: business_operations_v2
  title: Business Operations v2
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Completed Encounter Trends - Monthly
    name: Completed Encounter Trends - Monthly
    model: analytics_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_month, completed_encounters.referral_channel,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 11 months
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
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 2
    col: 16
    width: 8
    height: 8
  - title: Completed Encounter Trends - Weekly
    name: Completed Encounter Trends - Weekly
    model: analytics_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_completed_encounters]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 11 weeks
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 16
    col: 10
    width: 8
    height: 6
  - title: Completed Encounter - Quarterly Trend
    name: Completed Encounter - Quarterly Trend
    model: analytics_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: after 2019/01/01
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
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 2
    col: 0
    width: 8
    height: 8
  - title: Completed Encounter Trends - Quarterly (Copy)
    name: Completed Encounter Trends - Quarterly (Copy)
    model: analytics_prod
    explore: completed_encounters
    type: looker_line
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: 11 quarters
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 16
    col: 1
    width: 8
    height: 6
  - title: New Patients Trends - Quarterly
    name: New Patients Trends - Quarterly
    model: analytics_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_quarter, completed_encounters.referral_channel,
      completed_encounters.count_new_patients]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_quarter]
    filters:
      completed_encounters.date_of_service_date: 11 quarters
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
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 10
    col: 0
    width: 8
    height: 6
  - title: New Patients Trends - Monthly
    name: New Patients Trends - Monthly
    model: analytics_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_month, completed_encounters.referral_channel,
      completed_encounters.count_new_patients]
    pivots: [completed_encounters.referral_channel]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_date: 11 months
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    series_colors: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 10
    col: 8
    width: 8
    height: 6
  - title: New Patients Trends - Weekly
    name: New Patients Trends - Weekly
    model: analytics_prod
    explore: completed_encounters
    type: looker_column
    fields: [completed_encounters.date_of_service_week, completed_encounters.count_new_patients]
    fill_fields: [completed_encounters.date_of_service_week]
    filters:
      completed_encounters.date_of_service_date: 11 weeks
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Program: completed_encounters.referral_program
    row: 22
    col: 10
    width: 8
    height: 6
  - title: All-Time Completed Encounters (2019 - 2021)
    name: All-Time Completed Encounters (2019 - 2021)
    model: analytics_prod
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
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 2
  - title: Total Completed Encounters in Feb 2021
    name: Total Completed Encounters in Feb 2021
    model: analytics_prod
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
    listen: {}
    row: 0
    col: 16
    width: 4
    height: 2
  - title: Total Completed Encounters in 2021
    name: Total Completed Encounters in 2021
    model: analytics_prod
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
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 2
  - title: Completed Encounters by Referral Programs
    name: Completed Encounters by Referral Programs
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
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: b88b6581-484a-4f48-b65b-6631648f867e
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Referral Programs in 2021 to-date
    listen: {}
    row: 2
    col: 8
    width: 8
    height: 8
  - title: Avg Daily Encounters
    name: Avg Daily Encounters
    model: analytics_prod
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
    listen: {}
    row: 0
    col: 20
    width: 4
    height: 2
  - title: New Patients by US State
    name: New Patients by US State
    model: analytics_prod
    explore: completed_encounters
    type: looker_map
    fields: [completed_encounters.patient_state, completed_encounters.count_new_patients]
    sorts: [completed_encounters.count_new_patients desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: satellite_streets
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
    row:
    col:
    width:
    height:
  filters:
  - name: Referral Channel
    title: Referral Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
      options: []
    model: analytics_prod
    explore: completed_encounters
    listens_to_filters: []
    field: completed_encounters.referral_channel
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
    model: analytics_prod
    explore: completed_encounters
    listens_to_filters: []
    field: completed_encounters.referral_program
