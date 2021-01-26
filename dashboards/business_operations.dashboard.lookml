- dashboard: business_operations
  title: Business Operations
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Patients by Referral Program
    name: Patients by Referral Program
    model: analytics_prod
    explore: encounter_details
    type: looker_column
    fields: [patient_encounter_summary.referral_program, patient_encounter_summary.count_not_null_patients]
    sorts: [patient_encounter_summary.count_not_null_patients desc]
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
      Date Range: patient_encounter_summary.created_date
    row: 7
    col: 8
    width: 7
    height: 6
  - title: New Patient Trends
    name: New Patient Trends
    model: analytics_prod
    explore: encounter_details
    type: looker_column
    fields: [patient_encounter_summary.referral_program, patient_encounter_summary.count_not_null_patients,
      patient_encounter_summary.created_month]
    pivots: [patient_encounter_summary.referral_program]
    fill_fields: [patient_encounter_summary.created_month]
    sorts: [patient_encounter_summary.count_not_null_patients desc 0, patient_encounter_summary.referral_program]
    limit: 500
    column_limit: 10
    total: true
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
    trellis_rows: 5
    series_types: {}
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: patient_encounter_summary.created_date
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Completed Encounter Trends
    name: Completed Encounter Trends
    model: analytics_prod
    explore: encounter_details
    type: looker_column
    fields: [encounter_details.completed_encounters, encounter_details.dynamic_date_of_service]
    filters: {}
    sorts: [encounter_details.dynamic_date_of_service]
    limit: 500
    query_timezone: America/Los_Angeles
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
    x_axis_label: Date of Service
    series_types: {}
    x_axis_datetime_label: "%b %Y"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 10
    col: 0
    width: 8
    height: 5
  - title: Completed Encounters per Quarter
    name: Completed Encounters per Quarter
    model: analytics_prod
    explore: encounter_details
    type: looker_column
    fields: [encounter_details.date_of_service_quarter, encounter_details.completed_encounters,
      patient_encounter_summary.referral_program]
    pivots: [patient_encounter_summary.referral_program]
    fill_fields: [encounter_details.date_of_service_quarter]
    filters:
      encounter_details.date_of_service_date: '2020'
    sorts: [encounter_details.date_of_service_quarter desc, patient_encounter_summary.referral_program]
    limit: 500
    query_timezone: America/Los_Angeles
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
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Doesn't respond to Filter
    listen:
      Referral Program: patient_encounter_summary.referral_program
    row: 23
    col: 1
    width: 8
    height: 5
  - title: Encounter Volume by Referral Program
    name: Encounter Volume by Referral Program
    model: analytics_prod
    explore: encounter_details
    type: looker_pie
    fields: [patient_encounter_summary.referral_program, encounter_details.completed_encounters]
    sorts: [encounter_details.completed_encounters desc]
    limit: 10
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    series_types: {}
    defaults_version: 1
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 2
    col: 8
    width: 7
    height: 5
  - title: Completed Encounters in DateRange
    name: Completed Encounters in DateRange
    model: analytics_prod
    explore: encounter_details
    type: single_value
    fields: [encounter_details.completed_encounters]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 2
    col: 0
    width: 8
    height: 3
  - title: Encounter Volume By Provider Specialty
    name: Encounter Volume By Provider Specialty
    model: analytics_prod
    explore: encounter_details
    type: looker_pie
    fields: [encounter_details.provider_indicated_specialty, encounter_details.completed_encounters]
    filters: {}
    sorts: [encounter_details.completed_encounters desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
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
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 2
    col: 15
    width: 7
    height: 5
  - title: Encounter Volume By State of Visit
    name: Encounter Volume By State of Visit
    model: analytics_prod
    explore: encounter_details
    type: looker_waterfall
    fields: [encounter_details.completed_encounters, encounter_details.state_of_visit]
    sorts: [encounter_details.completed_encounters desc]
    limit: 500
    column_limit: 50
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
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
    show_null_points: true
    interpolation: linear
    map: auto
    map_projection: ''
    quantize_colors: false
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 7
    col: 16
    width: 7
    height: 5
  - title: Encounter Volume By Referral Channel
    name: Encounter Volume By Referral Channel
    model: analytics_prod
    explore: encounter_details
    type: looker_pie
    fields: [referral_channels.name, encounter_details.completed_encounters]
    sorts: [encounter_details.completed_encounters desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    series_colors: {}
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
    listen:
      Referral Program: patient_encounter_summary.referral_program
      Date Range: encounter_details.date_of_service_date
    row: 5
    col: 0
    width: 8
    height: 5
  - name: These Tiles Don't (Copy)
    type: text
    title_text: These Tiles Don't (Copy)
    subtitle_text: ''
    body_text: "<hr>"
    row: 21
    col: 0
    width: 24
    height: 2
  - name: These Tiles Filter
    type: text
    title_text: These Tiles Filter
    subtitle_text: ''
    body_text: "<hr>"
    row: 0
    col: 0
    width: 24
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: <img src="https://www.genomemedical.com/wp-content/uploads/2018/11/Group-34@2x.png"
      height="50%">
    row: 12
    col: 16
    width: 7
    height: 5
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
    row: 23
    col: 9
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
    field: patient_encounter_summary.created_date
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
