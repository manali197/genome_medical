- dashboard: referral_status_v2_prod
  title: Referral Status (Prod)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Average time (in days) from the referral date to the first appointment
      completed date
    name: Average time (in days) from the referral date to the first appointment completed
      date
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.date_of_service_month, referral_status.average_referral_to_visit_completion_time_in_days]
    fill_fields: [referral_status.date_of_service_month]
    filters:
      referral_status.date_of_service_year: 2 years
    sorts: [referral_status.date_of_service_month desc]
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
    defaults_version: 1
    row: 32
    col: 9
    width: 8
    height: 6
  - title: Average time between the date the appointment was scheduled to the date
      of the appointment (w/status = booked or completed)
    name: Average time between the date the appointment was scheduled to the date
      of the appointment (w/status = booked or completed)
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.date_of_service_month, referral_status.average_visit_created_to_completion_time_in_days]
    fill_fields: [referral_status.date_of_service_month]
    filters:
      referral_status.date_of_service_year: 2 years
    sorts: [referral_status.date_of_service_month desc]
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
    defaults_version: 1
    row: 20
    col: 0
    width: 8
    height: 6
  - title: 'Conversion: Average Days from Referral'
    name: 'Conversion: Average Days from Referral'
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.average_referral_to_scheduling_time_in_days, referral_status.original_referral_date_month,
      referral_status.average_referral_to_visit_completion_time_in_days, referral_status.average_visit_created_to_completion_time_in_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 12 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 500
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
    y_axes: [{label: Average Days between Referral Date and Date 1st Appt Created,
        orientation: left, series: [{axisId: referral_status.average_referral_to_scheduling_time_in_days,
            id: referral_status.average_referral_to_scheduling_time_in_days, name: Average
              time between the referral date and date 1st appointment was created}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Original Referral Date Month
    defaults_version: 1
    listen: {}
    row: 20
    col: 8
    width: 14
    height: 6
  - title: Moving Average test
    name: Moving Average test
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.average_referral_to_scheduling_time_in_days, referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 12 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: moving_average, label: Moving Average, expression: 'mean(offset_list(${referral_status.average_referral_to_scheduling_time_in_days},0,30))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: Average Days between Referral Date and Date 1st Appt Created,
        orientation: left, series: [{axisId: referral_status.average_referral_to_scheduling_time_in_days,
            id: referral_status.average_referral_to_scheduling_time_in_days, name: Average
              time between the referral date and date 1st appointment was created}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Original Referral Date Month
    defaults_version: 1
    listen: {}
    row: 38
    col: 0
    width: 14
    height: 6
  - title: Total Referrals
    name: Total Referrals
    model: analytics_prod
    explore: referral_status
    type: single_value
    fields: [referral_status.count_encounters, referral_status.referral_program]
    sorts: [referral_status.count_encounters desc]
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
    single_value_title: Total Referrals
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
    listen: {}
    row: 0
    col: 0
    width: 4
    height: 6
  - title: Total Referrals - QoQ Trend
    name: Total Referrals - QoQ Trend
    model: analytics_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.count_encounters, referral_status.original_referral_date_quarter,
      referral_status.referral_channel]
    pivots: [referral_status.referral_channel]
    fill_fields: [referral_status.original_referral_date_quarter]
    filters:
      referral_status.original_referral_date_quarter: 8 quarters
    sorts: [referral_status.original_referral_date_quarter desc, referral_status.referral_channel]
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
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Total Referrals
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 4
    width: 8
    height: 6
  - name: ARCHIVE // WIP BELOW
    type: text
    title_text: ARCHIVE // WIP BELOW
    subtitle_text: ''
    body_text: ''
    row: 18
    col: 0
    width: 24
    height: 2
  - title: 'Conversion Time: After Referral, how long does it take to book the First
      Appointment?'
    name: 'Conversion Time: After Referral, how long does it take to book the First
      Appointment?'
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.average_referral_to_scheduling_time_in_days, referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 24 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 13
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
    y_axes: [{label: Average Days between Referral Date and Date 1st Appt Created,
        orientation: left, series: [{axisId: referral_status.average_referral_to_scheduling_time_in_days,
            id: referral_status.average_referral_to_scheduling_time_in_days, name: Average
              time between the referral date and date 1st appointment was created}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Original Referral Date Month
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Average Time from Referral Date to Creation of First Appointment
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 6
  - title: 'Appointment Time: After Scheduling, how soon is the First Appointment?'
    name: 'Appointment Time: After Scheduling, how soon is the First Appointment?'
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.original_referral_date_month, referral_status.average_visit_created_to_completion_time_in_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 24 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 13
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
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    y_axes: [{label: Average Days between Appt Scheduled Date to Date of Appt, orientation: left,
        series: [{axisId: referral_status.average_visit_created_to_completion_time_in_days,
            id: referral_status.average_visit_created_to_completion_time_in_days,
            name: Average time (in days) between the date the appointment was scheduled
              to the date of the appointment (w/status = booked or completed)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Original Referral Date Month
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: Average Days from Appointment Scheduled Date to Date of Appointment
      (Scheduled or Completed)
    listen: {}
    row: 6
    col: 0
    width: 12
    height: 6
  - title: 'Completion Time: After Referral, how soon is the First Appointment completed?'
    name: 'Completion Time: After Referral, how soon is the First Appointment completed?'
    model: analytics_prod
    explore: referral_status
    type: looker_line
    fields: [referral_status.original_referral_date_month, referral_status.average_referral_to_visit_completion_time_in_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 24 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 13
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
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Average Days between Referral Date and 1st Appt Completed Date,
        orientation: left, series: [{axisId: referral_status.average_visit_created_to_completion_time_in_days,
            id: referral_status.average_visit_created_to_completion_time_in_days,
            name: Average time (in days) between the date the appointment was scheduled
              to the date of the appointment (w/status = booked or completed)}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Original Referral Date Month
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Average Days from Referral Date to First Appointment Completion Date
    listen: {}
    row: 6
    col: 12
    width: 12
    height: 6
  - title: '"is first visit scheduled encounter"'
    name: '"is first visit scheduled encounter"'
    model: analytics_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.count, referral_status.original_referral_date_month,
      referral_status.is_first_visit_scheduled_encounter]
    pivots: [referral_status.is_first_visit_scheduled_encounter]
    fill_fields: [referral_status.is_first_visit_scheduled_encounter, referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 24 months
    sorts: [referral_status.original_referral_date_month desc, referral_status.is_first_visit_scheduled_encounter]
    limit: 13
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
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Encounter Count, orientation: left, series: [{axisId: No - referral_status.count,
            id: No - referral_status.count, name: Encounter Not Completed}, {axisId: Yes
              - referral_status.count, id: Yes - referral_status.count, name: Encounter
              Completed}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels: {}
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 26
    col: 7
    width: 8
    height: 6
  - title: Time for Referral to First Visit (QA)
    name: Time for Referral to First Visit (QA)
    model: analytics_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, referral_status.max_referral_to_scheduling_time_in_days,
      referral_status.average_referral_to_scheduling_time_in_days, referral_status.min_referral_to_scheduling_time_in_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 12 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 13
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Time In Days, orientation: left, series: [{axisId: referral_status.max_referral_to_scheduling_time_in_days,
            id: referral_status.max_referral_to_scheduling_time_in_days, name: Maximum
              Referral Time}, {axisId: referral_status.average_referral_to_scheduling_time_in_days,
            id: referral_status.average_referral_to_scheduling_time_in_days, name: Average
              Referral Time}, {axisId: referral_status.min_referral_to_scheduling_time_in_days,
            id: referral_status.min_referral_to_scheduling_time_in_days, name: Minimum
              Referral Time}], showLabels: true, showValues: true, valueFormat: "#",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Original Referral Date Month
    font_size: '10'
    label_value_format: ''
    series_types:
      referral_status.average_referral_to_scheduling_time_in_days: line
    series_colors:
      referral_status.min_referral_to_scheduling_time_in_days: "#C2DD67"
      referral_status.average_referral_to_scheduling_time_in_days: "#9174F0"
      referral_status.max_referral_to_scheduling_time_in_days: "#FBB555"
    series_labels:
      referral_status.min_referral_to_scheduling_time_in_days: Minimum Referral Time
      referral_status.average_referral_to_scheduling_time_in_days: Average Referral
        Time
      referral_status.max_referral_to_scheduling_time_in_days: Maximum Referral Time
    series_point_styles:
      referral_status.average_referral_to_scheduling_time_in_days: diamond
    label_color: [transparent, black]
    column_group_spacing_ratio: 0.2
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 12
    col: 0
    width: 12
    height: 6
  - title: Time for Referral to Return of Results visit (QA)
    name: Time for Referral to Return of Results visit (QA)
    model: analytics_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, referral_status.min_visit_referral_to_completion_time_with_ror_in_days,
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days, referral_status.average_visit_referral_to_completion_time_with_ror_in_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 12 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 13
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Time, orientation: left, series: [{axisId: referral_status.min_visit_referral_to_completion_time_with_ror_in_days,
            id: referral_status.min_visit_referral_to_completion_time_with_ror_in_days,
            name: Min Time}, {axisId: referral_status.max_visit_referral_to_completion_time_with_ror_in_days,
            id: referral_status.max_visit_referral_to_completion_time_with_ror_in_days,
            name: Max Time}, {axisId: referral_status.average_visit_referral_to_completion_time_with_ror_in_days,
            id: referral_status.average_visit_referral_to_completion_time_with_ror_in_days,
            name: Average Time}], showLabels: true, showValues: true, valueFormat: "#",
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 15, type: linear}]
    x_axis_label: Original Referral Date Month
    font_size: '12'
    label_value_format: ''
    series_types:
      referral_status.average_referral_to_scheduling_time_in_days: line
      referral_status.average_visit_referral_to_completion_time_with_ror_in_days: line
    series_colors:
      referral_status.min_referral_to_scheduling_time_in_days: "#C2DD67"
      referral_status.average_referral_to_scheduling_time_in_days: "#9174F0"
      referral_status.max_referral_to_scheduling_time_in_days: "#FBB555"
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days: "#FFD95F"
      referral_status.min_visit_referral_to_completion_time_with_ror_in_days: "#C2DD67"
      referral_status.average_visit_referral_to_completion_time_with_ror_in_days: "#75E2E2"
    series_labels:
      referral_status.min_referral_to_scheduling_time_in_days: Minimum Referral Time
      referral_status.average_referral_to_scheduling_time_in_days: Average Referral
        Time
      referral_status.max_referral_to_scheduling_time_in_days: Maximum Referral Time
      referral_status.average_visit_referral_to_completion_time_with_ror_in_days: Average
        Time
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days: Max
        Time
      referral_status.min_visit_referral_to_completion_time_with_ror_in_days: Min
        Time
    series_point_styles:
      referral_status.average_referral_to_scheduling_time_in_days: diamond
    label_color: [transparent, transparent, black]
    column_group_spacing_ratio: 0.2
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    row: 12
    col: 12
    width: 12
    height: 6
