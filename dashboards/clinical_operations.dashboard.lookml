- dashboard: clinical_operations
  title: Clinical Operations
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Visit CAP Count By Provider
    name: Visit CAP Count By Provider
    model: analytics_prod
    explore: encounter_details
    type: looker_column
    fields: [encounter_details.visit_cap_sending_cc, encounter_details.count_not_null_not_blank_visit_caps]
    sorts: [encounter_details.count_not_null_not_blank_visit_caps desc]
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
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.initial_visit_summary_sent_date
    row: 5
    col: 0
    width: 8
    height: 6
  - title: Result CAP Count By Provider
    name: Result CAP Count By Provider
    model: analytics_prod
    explore: encounter_details
    type: looker_column
    fields: [encounter_details.results_cap_sending_cc, encounter_details.count_not_null_not_blank_result_caps]
    sorts: [encounter_details.count_not_null_not_blank_result_caps desc]
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
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.followup_cap_completed_date
    row: 11
    col: 0
    width: 8
    height: 6
  - title: Visit CAP Trends
    name: Visit CAP Trends
    model: analytics_prod
    explore: encounter_details
    type: looker_line
    fields: [encounter_details.count_not_null_not_blank_visit_caps, encounter_details.initial_visit_summary_sent_date]
    fill_fields: [encounter_details.initial_visit_summary_sent_date]
    filters: {}
    sorts: [encounter_details.initial_visit_summary_sent_date desc]
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
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.initial_visit_summary_sent_date
    row: 2
    col: 8
    width: 8
    height: 6
  - title: Result CAP Trends
    name: Result CAP Trends
    model: analytics_prod
    explore: encounter_details
    type: looker_line
    fields: [encounter_details.count_not_null_not_blank_result_caps, encounter_details.followup_cap_completed_date]
    fill_fields: [encounter_details.followup_cap_completed_date]
    filters: {}
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
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.followup_cap_completed_date
    row: 8
    col: 8
    width: 8
    height: 6
  - title: Average Visit Completion Time Trends
    name: Average Visit Completion Time Trends
    model: analytics_prod
    explore: encounter_details
    type: looker_area
    fields: [encounter_details.date_of_service_month, encounter_details.average_visit_cap_completion_time_in_days,
      referral_channels.name]
    pivots: [referral_channels.name]
    fill_fields: [encounter_details.date_of_service_month]
    filters:
      encounter_details.encounter_type: visit
      encounter_details.date_of_service_date: '2020'
    sorts: [encounter_details.date_of_service_month desc, referral_channels.name]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
    row: 19
    col: 0
    width: 8
    height: 6
  - title: Average Result Completion Time Trends
    name: Average Result Completion Time Trends
    model: analytics_prod
    explore: encounter_details
    type: looker_area
    fields: [encounter_details.date_of_service_month, referral_channels.name, encounter_details.average_result_cap_completion_time_in_days]
    pivots: [referral_channels.name]
    fill_fields: [encounter_details.date_of_service_month]
    filters:
      encounter_details.encounter_type: visit
      encounter_details.date_of_service_date: '2020'
    sorts: [encounter_details.date_of_service_month desc, referral_channels.name]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
    row: 19
    col: 8
    width: 8
    height: 6
  - name: These Tiles DO NOT filter
    type: text
    title_text: These Tiles DO NOT filter
    subtitle_text: ''
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 2
  - name: These Tiles filter
    type: text
    title_text: These Tiles filter
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: VisitCapCount
    name: VisitCapCount
    model: analytics_prod
    explore: encounter_details
    type: single_value
    fields: [encounter_details.count_not_null_not_blank_visit_caps]
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
    series_types: {}
    defaults_version: 1
    listen:
      Date Range: encounter_details.date_of_service_date
    row: 2
    col: 0
    width: 8
    height: 3
  - title: PatientsByState
    name: PatientsByState
    model: analytics_prod
    explore: encounter_details
    type: looker_map
    fields: [patient_encounter_summary.patient_state, patient_encounter_summary.count]
    sorts: [patient_encounter_summary.patient_state]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
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
    series_types: {}
    defaults_version: 1
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
    value_labels: legend
    label_type: labPer
    map_latitude: 50.85710981721644
    map_longitude: -38.5552740097046
    map_zoom: 2
    listen: {}
    row: 25
    col: 0
    width: 8
    height: 6
  - name: aSDASD
    type: text
    title_text: aSDASD
    subtitle_text: ''
    body_text: ''
    row: 31
    col: 0
    width: 8
    height: 6
  filters:
  - name: Date Range
    title: Date Range
    type: field_filter
    default_value: 90 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: analytics_prod
    explore: encounter_details
    listens_to_filters: []
    field: encounter_details.date_of_service_date
  - name: Referral Program
    title: Referral Program
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: analytics_prod
    explore: encounter_details
    listens_to_filters: []
    field: patient_encounter_summary.referral_program
