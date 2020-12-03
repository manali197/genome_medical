- dashboard: clinical_operations
  title: Clinical Operations
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Visit CAP Count By Provider
    name: Visit CAP Count By Provider
    model: genome
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
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Result CAP Count By Provider
    name: Result CAP Count By Provider
    model: genome
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
      Date Range: encounter_details.cap_sent_to_patient_date
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Visit CAP Trends
    name: Visit CAP Trends
    model: genome
    explore: encounter_details
    type: looker_line
    fields: [encounter_details.date_of_service_week, encounter_details.count_not_null_not_blank_visit_caps]
    fill_fields: [encounter_details.date_of_service_week]
    filters:
      encounter_details.date_of_service_week: '2020'
    sorts: [encounter_details.date_of_service_week desc]
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
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.initial_visit_summary_sent_week
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Result CAP Trends
    name: Result CAP Trends
    model: genome
    explore: encounter_details
    type: looker_line
    fields: [encounter_details.date_of_service_week, encounter_details.count_not_null_not_blank_result_caps]
    fill_fields: [encounter_details.date_of_service_week]
    filters:
      encounter_details.date_of_service_week: '2020'
    sorts: [encounter_details.date_of_service_week desc]
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
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.initial_visit_summary_sent_week
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Average Visit Completion Time Trends
    name: Average Visit Completion Time Trends
    model: genome
    explore: encounter_details
    type: looker_area
    fields: [encounter_details.date_of_service_month, encounter_details.average_visit_cap_completion_time_in_days,
      referral_channels.name]
    pivots: [referral_channels.name]
    fill_fields: [encounter_details.date_of_service_month]
    filters:
      encounter_details.encounter_type: visit
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
      Date Range: encounter_details.date_of_service_date
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Average Result Completion Time Trends
    name: Average Result Completion Time Trends
    model: genome
    explore: encounter_details
    type: looker_area
    fields: [encounter_details.date_of_service_month, referral_channels.name, encounter_details.average_result_cap_completion_time_in_days]
    pivots: [referral_channels.name]
    fill_fields: [encounter_details.date_of_service_month]
    filters:
      encounter_details.encounter_type: visit
      encounter_details.date_of_service_date: '2020,2019'
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
      Date Range: encounter_details.initial_visit_summary_sent_month
    row: 6
    col: 16
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
    model: genome
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
    model: genome
    explore: encounter_details
    listens_to_filters: []
    field: patient_encounter_summary.referral_program
