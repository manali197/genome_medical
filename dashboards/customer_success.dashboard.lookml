- dashboard: cs_analytics
  title: CS Analytics
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 'Average Time: Referral to Date of Scheduling'
    name: 'Average Time: Referral to Date of Scheduling'
    model: analytics_prod
    explore: encounter_details
    type: looker_area
    fields: [patient_encounter_summary.original_referral_month, encounter_details.average_referral_to_scheduling_time_in_days,
      referral_channels.name]
    pivots: [referral_channels.name]
    fill_fields: [patient_encounter_summary.original_referral_month]
    filters:
      encounter_details.encounter_type: visit
    sorts: [patient_encounter_summary.original_referral_month desc, referral_channels.name]
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
    point_style: circle
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    ordering: none
    show_null_labels: false
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: patient_encounter_summary.original_referral_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Visit Volume By Visit Status
    name: Visit Volume By Visit Status
    model: analytics_prod
    explore: encounter_details
    type: looker_area
    fields: [encounter_details.date_of_service_month, encounter_details.visit_status,
      encounter_details.count_not_null_encounters]
    pivots: [encounter_details.visit_status]
    fill_fields: [encounter_details.date_of_service_month]
    filters:
      encounter_details.encounter_type: visit
    sorts: [encounter_details.date_of_service_month desc, encounter_details.visit_status]
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
    series_types: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 0
    col: 8
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
    field: encounter_details.created_date
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
