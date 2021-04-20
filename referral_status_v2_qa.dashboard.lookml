- dashboard: cs_referral_status__partner_dashboard_qa
  title: CS Referral Status / Partner Dashboard (QA)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 'Conversion: Average Days from Referral'
    name: 'Conversion: Average Days from Referral'
    model: analytics_qa
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
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: referral_status.average_referral_to_scheduling_time_in_days,
            id: referral_status.average_referral_to_scheduling_time_in_days, name: Avg
              Days from Referral Date to First Appointment Created Date}, {axisId: referral_status.average_referral_to_visit_completion_time_in_days,
            id: referral_status.average_referral_to_visit_completion_time_in_days,
            name: Avg Days from Referral Date to First Appointment Completed Date},
          {axisId: referral_status.average_visit_created_to_completion_time_in_days,
            id: referral_status.average_visit_created_to_completion_time_in_days,
            name: Avg days from Appointment Scheduled to Date of Appointment (w/status
              = booked or completed)}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: custom, tickDensityCustom: 47, type: linear}]
    x_axis_label: Original Referral Date Month
    font_size: '10'
    series_labels:
      referral_status.average_referral_to_scheduling_time_in_days: Avg Days from Referral
        Date to First Appointment Created Date
      referral_status.average_referral_to_visit_completion_time_in_days: Avg Days
        from Referral Date to First Appointment Completed Date
      referral_status.average_visit_created_to_completion_time_in_days: Avg days from
        Appointment Scheduled to Date of Appointment (w/status = booked or completed)
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 10
    col: 12
    width: 12
    height: 8
  - title: All-Time Referrals (QA)
    name: All-Time Referrals (QA)
    model: analytics_qa
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
    single_value_title: All-Time Referrals
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
    note_state: collapsed
    note_display: hover
    note_text: Total Referral count from the beginning of time
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 2
    col: 0
    width: 5
    height: 4
  - name: ARCHIVE // WIP BELOW
    type: text
    title_text: ARCHIVE // WIP BELOW
    subtitle_text: ''
    body_text: ''
    row: 49
    col: 0
    width: 24
    height: 2
  - title: NEED TO UPDATE TO RESULTS RECEIVED - Time from Referral to Completed Return
      of Results visit (QA)
    name: NEED TO UPDATE TO RESULTS RECEIVED - Time from Referral to Completed Return
      of Results visit (QA)
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, referral_status.min_visit_referral_to_completion_time_with_ror_in_days,
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days, referral_status.average_visit_referral_to_completion_time_with_ror_in_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 12 months
    sorts: [referral_status.original_referral_date_month desc]
    limit: 13
    x_axis_gridlines: true
    y_axis_gridlines: true
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
    y_axes: [{label: Time, orientation: left, series: [{axisId: referral_status.min_visit_referral_to_completion_time_with_ror_in_days,
            id: referral_status.min_visit_referral_to_completion_time_with_ror_in_days,
            name: Min Days from Referral to Completed RoR Visit}, {axisId: referral_status.max_visit_referral_to_completion_time_with_ror_in_days,
            id: referral_status.max_visit_referral_to_completion_time_with_ror_in_days,
            name: Max Days from Referral to Completed RoR Visit}, {axisId: referral_status.average_visit_referral_to_completion_time_with_ror_in_days,
            id: referral_status.average_visit_referral_to_completion_time_with_ror_in_days,
            name: Average Days from Referral to Completed RoR Visit}], showLabels: true,
        showValues: true, valueFormat: "#", unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 32, type: linear}]
    x_axis_label: Original Referral Date Month
    font_size: '10'
    label_value_format: ''
    series_types:
      referral_status.average_referral_to_scheduling_time_in_days: line
      referral_status.average_visit_referral_to_completion_time_with_ror_in_days: line
      referral_status.min_visit_referral_to_completion_time_with_ror_in_days: scatter
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days: area
    series_colors:
      referral_status.min_referral_to_scheduling_time_in_days: "#C2DD67"
      referral_status.average_referral_to_scheduling_time_in_days: "#9174F0"
      referral_status.max_referral_to_scheduling_time_in_days: "#FBB555"
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days: "#B1399E"
      referral_status.min_visit_referral_to_completion_time_with_ror_in_days: "#3EB0D5"
      referral_status.average_visit_referral_to_completion_time_with_ror_in_days: "#FFD95F"
    series_labels:
      referral_status.min_referral_to_scheduling_time_in_days: Minimum Referral Time
      referral_status.average_referral_to_scheduling_time_in_days: Average Referral
        Time
      referral_status.max_referral_to_scheduling_time_in_days: Maximum Referral Time
      referral_status.average_visit_referral_to_completion_time_with_ror_in_days: Average
        Days from Referral to Completed RoR Visit
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days: Max
        Days from Referral to Completed RoR Visit
      referral_status.min_visit_referral_to_completion_time_with_ror_in_days: Min
        Days from Referral to Completed RoR Visit
    series_point_styles:
      referral_status.average_referral_to_scheduling_time_in_days: diamond
      referral_status.min_visit_referral_to_completion_time_with_ror_in_days: triangle
      referral_status.max_visit_referral_to_completion_time_with_ror_in_days: triangle-down
    label_color: [transparent, transparent, black]
    column_group_spacing_ratio: 0.2
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 10
    col: 0
    width: 12
    height: 8
  - title: Patient Outreach Status
    name: Patient Outreach Status
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.count, referral_status.original_referral_date_month,
      referral_status.patient_outreach_setting_enabled]
    pivots: [referral_status.patient_outreach_setting_enabled]
    fill_fields: [referral_status.original_referral_date_month, referral_status.patient_outreach_setting_enabled]
    filters:
      referral_status.original_referral_date_month: 6 months
    sorts: [referral_status.original_referral_date_month desc, referral_status.patient_outreach_setting_enabled]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: "% of Referred Patients", orientation: left, series: [{axisId: No
              - referral_status.count, id: No - referral_status.count, name: Patient
              Declined Outreach}, {axisId: Yes - referral_status.count, id: Yes -
              referral_status.count, name: Patient Approved Outreach}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '10'
    series_types: {}
    series_colors:
      No - referral_status.count: "#9174F0"
      Yes - referral_status.count: "#72D16D"
    series_labels:
      No - referral_status.count: Patient Declined Outreach
      Yes - referral_status.count: Patient Did Not Decline Outreach
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 20
    col: 12
    width: 11
    height: 4
  - title: All-Time Completed Encounters (QA)
    name: All-Time Completed Encounters (QA)
    model: analytics_qa
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
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: All-Time
    listen: {}
    row: 34
    col: 12
    width: 7
    height: 3
  - title: Total Referrals MTD (QA)
    name: Total Referrals MTD (QA)
    model: analytics_qa
    explore: referral_status
    type: single_value
    fields: [referral_status.count_encounters, referral_status.original_referral_date_month]
    pivots: [referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 2 months
      referral_status.is_before_mtd: 'Yes'
    sorts: [referral_status.count_encounters desc 0, referral_status.original_referral_date_month
        desc]
    limit: 500
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
    comparison_label: Referrals vs Previous MTD
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
    note_state: collapsed
    note_display: hover
    note_text: Total Referral count for just the current month, compared to the same
      day on the prior month
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 6
    col: 0
    width: 5
    height: 4
  - title: Completed Encounters - MTD
    name: Completed Encounters - MTD
    model: analytics_qa
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
    column_limit: 50
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
    note_state: collapsed
    note_display: above
    note_text: Current Month to-Date
    listen: {}
    row: 31
    col: 19
    width: 5
    height: 6
  - title: Total Referrals - QoQ Trend (QA)
    name: Total Referrals - QoQ Trend (QA)
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.count_encounters, referral_status.original_referral_date_quarter,
      referral_status.referal_patient_visit_status]
    pivots: [referral_status.referal_patient_visit_status]
    fill_fields: [referral_status.original_referral_date_quarter]
    filters:
      referral_status.original_referral_date_quarter: 5 quarters
    sorts: [referral_status.original_referral_date_quarter desc, referral_status.referal_patient_visit_status]
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
    color_application:
      collection_id: aed851c8-b22d-4b01-8fff-4b02b91fe78d
      palette_id: c36094e3-d04d-4aa4-8ec7-bc9af9f851f4
      options:
        steps: 5
    font_size: '10'
    series_types: {}
    series_labels:
      Status unknown - referral_status.count_encounters: Status currently unknown
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
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 2
    col: 5
    width: 9
    height: 8
  - name: Referral Status
    type: text
    title_text: Referral Status
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Encounter Status
    type: text
    title_text: Encounter Status
    subtitle_text: ''
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 2
  - name: Outreach
    type: text
    title_text: Outreach
    subtitle_text: ''
    body_text: ''
    row: 18
    col: 0
    width: 23
    height: 2
  - name: types of outreach that convert to scheduling
    type: text
    title_text: types of outreach that convert to scheduling
    subtitle_text: 'bar comparison '
    body_text: how many pts in March converted to schedule their appt from phone outreach
      vs email outreach in march?
    row: 24
    col: 13
    width: 11
    height: 4
  - title: Encounter Test Orders Status
    name: Encounter Test Orders Status
    model: analytics_qa
    explore: referral_status
    type: looker_bar
    fields: [test_order_status, encounters_count]
    filters:
      referral_status.test_order_status: "-Order Status Pending,-N/A,-Testing Not\
        \ Recommended"
    sorts: [encounters_count desc]
    limit: 500
    dynamic_fields: [{dimension: test_order_status, label: Test Order Status, expression: "if(\n\
          \    contains(${referral_status.test_order_status},\",\"),\n    \"Multi-Test\
          \ Encounter\",\n  if(\n      ${referral_status.test_order_status} = \"approved\"\
          \ OR ${referral_status.test_order_status} = \"waiting_to_submit\",\n   \
          \   \"Approved\",\n    if(\n        contains(${referral_status.test_order_status},\"\
          cancelled\") OR contains(${referral_status.test_order_status},\"rejected\"\
          ) OR contains(${referral_status.test_order_status},\"no_test\"),\n     \
          \   \"Cancelled or Rejected\",\n      if(\n          contains(${referral_status.test_order_status},\"\
          declined\") OR ${referral_status.test_order_status} = \"iss_w_test_implications\"\
          \ OR ${referral_status.test_order_status} = \"no_fu_from_patient\" OR ${referral_status.test_order_status}\
          \ = \"ins_denied_cost\" OR ${referral_status.test_order_status} = \"patient_not_responsive\"\
          \ OR ${referral_status.test_order_status} = \"patient_undecided\", \n  \
          \        \"Patient Declined or Unresponsive\", \n        if(\n         \
          \   ${referral_status.test_order_status} = \"patient_undecided\",\n    \
          \        \"Patient Undecided\",\n            if(\n                contains(${referral_status.test_order_status},\
          \ \"result\"),\n                \"Results Received\",\n                if(\n\
          \                    contains(${referral_status.test_order_status}, \"awaiting\"\
          ),\n                    \"Waiting to Submit\",\n                    if(\n\
          \                        ${referral_status.test_order_status} = \"sent_to_lab\"\
          ,\n                        \"Sent to Lab\",\n                        if(\n\
          \                            ${referral_status.test_order_status} = \"sample_not_submitted\"\
          ,\n                            \"Sample Not Submitted\",\n             \
          \               if(\n                                ${referral_status.test_order_status}\
          \ = \"requested\",\n                                \"Requested\",\n   \
          \                             \"Other\"\n                              \
          \  )\n                            )\n                        )\n       \
          \             )\n                )\n            )\n        ) \n      )\n\
          \    )\n)", value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}, {measure: encounters_count, based_on: referral_status.encounter_uuid,
        type: count_distinct, label: Encounters Count, expression: !!null '', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: encounters_count,
            id: encounters_count, name: Encounters Count}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 14, type: linear}]
    font_size: '10'
    series_types: {}
    series_colors: {}
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 37
    col: 12
    width: 12
    height: 5
  - title: "% of Appointments Scheduled in 2 days"
    name: "% of Appointments Scheduled in 2 days"
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, distinct_encounter_count,
      scheduled_in_under_2_days]
    pivots: [scheduled_in_under_2_days]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 6 months
      referral_status.is_first_visit_encounter: 'Yes'
    sorts: [referral_status.original_referral_date_month desc, scheduled_in_under_2_days]
    limit: 500
    dynamic_fields: [{measure: distinct_encounter_count, based_on: referral_status.encounter_uuid,
        type: count_distinct, label: Distinct Encounter Count, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: scheduled_in_2_days, label: "% Scheduled\
          \ in 2 Days", expression: "${encounter_scheduled_within_2_days_count}/${distinct_encounter_count}",
        value_format: !!null '', value_format_name: percent_0, is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {dimension: scheduled_in_under_2_days,
        label: 'Scheduled in under 2 days?', expression: "${referral_status.referral_to_scheduling_time}\
          \ <=2", value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}, {measure: encounter_scheduled_within_2_days_count, based_on: referral_status.encounter_uuid,
        type: count_distinct, label: Encounter Scheduled Within 2 Days Count, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: "${scheduled_in_under_2_days}\
          \ = yes"}]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Percentage of Appointments Scheduled, orientation: left, series: [
          {axisId: No - distinct_encounter_count, id: No - distinct_encounter_count,
            name: Appointment scheduled in 2+ days}, {axisId: Yes - distinct_encounter_count,
            id: Yes - distinct_encounter_count, name: Appointment scheduled within
              2 days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '10'
    series_types: {}
    series_labels:
      Yes - distinct_encounter_count: Appointment scheduled within 2 days
      No - distinct_encounter_count: Appointment scheduled in over 2 days
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#72D16D",
        line_value: ".9", label: GOAL}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [encounter_scheduled_within_7_days_count]
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 2
    col: 14
    width: 10
    height: 8
  - title: Monthly Encounters by Consultation Type
    name: Monthly Encounters by Consultation Type
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.count_encounters, referral_status.consultation_type_limited,
      referral_status.date_of_service_month]
    pivots: [referral_status.consultation_type_limited]
    fill_fields: [referral_status.date_of_service_month]
    filters:
      referral_status.date_of_service_month: 6 months
    sorts: [referral_status.consultation_type_limited, referral_status.date_of_service_month
        desc]
    limit: 12
    column_limit: 50
    dynamic_fields: [{measure: count_of_is_first_visit_completed_no_ror_encounter_yes_no,
        based_on: referral_status.is_first_visit_completed_no_ror_encounter, expression: '',
        label: Count of Is First Visit Completed No Ror Encounter (Yes / No), type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {measure: count_of_is_first_visit_completed_ror_encounter_yes_no,
        based_on: referral_status.is_first_visit_completed_ror_encounter, expression: '',
        label: Count of Is First Visit Completed Ror Encounter (Yes / No), type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {measure: count_of_is_first_visit_completed_with_ror_encounter_yes_no,
        based_on: referral_status.is_first_visit_completed_with_ror_encounter, expression: '',
        label: Count of Is First Visit Completed with Ror Encounter (Yes / No), type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {measure: count_of_is_first_visit_completed_no_ror_encounter_yes_no_2,
        based_on: referral_status.is_first_visit_completed_no_ror_encounter, expression: '',
        label: Count of Is First Visit Completed No Ror Encounter (Yes / No), type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {measure: count_of_is_first_visit_completed_ror_encounter_yes_no_2,
        based_on: referral_status.is_first_visit_completed_ror_encounter, expression: '',
        label: Count of Is First Visit Completed Ror Encounter (Yes / No), type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {measure: count_of_is_first_visit_completed_with_ror_encounter_yes_no_2,
        based_on: referral_status.is_first_visit_completed_with_ror_encounter, expression: '',
        label: Count of Is First Visit Completed with Ror Encounter (Yes / No), type: count_distinct,
        _kind_hint: measure, _type_hint: number}]
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
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    hide_legend: false
    font_size: '10'
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
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 31
    col: 0
    width: 12
    height: 8
  - title: Top 10 Tests Ordered
    name: Top 10 Tests Ordered
    model: analytics_qa
    explore: referral_status
    type: looker_pie
    fields: [top_test.top_10_test_name, referral_status.count, top_test.test_rank]
    filters:
      referral_status.test_name: "-EMPTY"
      top_test.test_rank: "<12"
    sorts: [top_test.test_rank]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: list_of_test_name, based_on: referral_status.test_name,
        expression: '', label: List of Test Name, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: count_of_test_name, based_on: referral_status.test_name,
        expression: '', label: Count of Test Name, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    value_labels: legend
    label_type: labVal
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 629b455f-662e-4854-a424-4f0c9d4bbdfb
      options:
        steps: 5
    series_types: {}
    defaults_version: 1
    hidden_fields: [top_test.test_rank]
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 42
    col: 12
    width: 12
    height: 7
  - title: Count of Patients w/ 1+ Visits Scheduled
    name: Count of Patients w/ 1+ Visits Scheduled
    model: analytics_qa
    explore: referral_status
    type: single_value
    fields: [referral_status.patient_uuid, referral_status.count]
    filters:
      referral_status.count: ">1"
      referral_status.visit_status: booked
    sorts: [referral_status.count desc]
    limit: 5000
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'count(${referral_status.patient_uuid})',
        value_format: !!null '', value_format_name: !!null '', is_disabled: true,
        _kind_hint: dimension, _type_hint: number}, {table_calculation: total_people_with_1_visit_scheduled,
        label: Total People with 1+ visit scheduled, expression: 'count(${referral_status.patient_uuid})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
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
    defaults_version: 1
    hidden_fields: [referral_status.patient_uuid, referral_status.count]
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: Total Count of Patients
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 39
    col: 6
    width: 6
    height: 3
  - title: Number of outreaches it takes to schedule
    name: Number of outreaches it takes to schedule
    model: analytics_qa
    explore: referral_status
    type: looker_pie
    fields: [referral_status.number_of_outreaches_before_encounter_creation, referral_status.count]
    filters:
      referral_status.encounter_uuid: "-NULL"
      referral_status.number_of_outreaches_before_encounter_creation: NOT NULL
      referral_status.encounter_type: visit
    sorts: [referral_status.number_of_outreaches_before_encounter_creation]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
      options:
        steps: 5
    series_colors: {}
    series_labels:
      '1': 1 outreach before Visit Scheduled
      '2': 2 outreaches before before Visit Scheduled
      '3': 3 outreaches before before Visit Scheduled
      '4': 4 outreaches before before Visit Scheduled
      '5': 5 outreaches before Visit Scheduled
      '6': 6 outreaches before Visit Scheduled
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
    show_null_points: true
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 20
    col: 0
    width: 12
    height: 9
  - title: Top 10 Labs Utilized
    name: Top 10 Labs Utilized
    model: analytics_qa
    explore: referral_status
    type: looker_pie
    fields: [top_labs.top_10_labs_name, top_labs.lab_rank, referral_status.count]
    filters:
      referral_status.testing_lab: "-NULL"
      top_labs.lab_rank: "<12"
    sorts: [referral_status.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: list_of_test_name, based_on: referral_status.test_name,
        expression: '', label: List of Test Name, type: list, _kind_hint: measure,
        _type_hint: list}, {measure: count_of_test_name, based_on: referral_status.test_name,
        expression: '', label: Count of Test Name, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    value_labels: legend
    label_type: labVal
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    hidden_fields: [top_labs.lab_rank]
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 42
    col: 0
    width: 12
    height: 7
  - title: Count of Patients w/ 1+ Encounters Completed
    name: Count of Patients w/ 1+ Encounters Completed
    model: analytics_qa
    explore: referral_status
    type: single_value
    fields: [referral_status.patient_uuid, referral_status.count]
    filters:
      referral_status.visit_status: "%3958\t\r\n\tcompleted%,%complete%,%completed%,%Completed%,%webinar^_attended%,%webinar^_recording^_viewed%"
      referral_status.count: ">1"
    sorts: [referral_status.count desc]
    limit: 5000
    dynamic_fields: [{table_calculation: total_people_with_1_encounter_completed,
        label: Total People with 1+ encounter completed, expression: 'count(${referral_status.patient_uuid})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
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
    defaults_version: 1
    hidden_fields: [referral_status.patient_uuid, referral_status.count]
    series_types: {}
    note_state: collapsed
    note_display: above
    note_text: Total Count of Patients
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 39
    col: 0
    width: 6
    height: 3
  - name: "% who Scheduled at least 1 Encounter"
    title: "% who Scheduled at least 1 Encounter"
    merged_queries:
    - model: analytics_qa
      explore: referral_status
      type: single_value
      fields: [referral_status.count_patients_with_morethan_1_encounters, referral_status.count,
        referral_status.dummy, referral_status.patient_uuid]
      filters:
        referral_status.count: ">1"
      sorts: [referral_status.count_patients_with_morethan_1_encounters desc]
      limit: 5000
      dynamic_fields: [{table_calculation: more_than_1_encounters, label: More than
            1 encounters, expression: 'sum(${referral_status.count_patients_with_morethan_1_encounters})',
          value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number}]
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: value
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      hidden_fields: [referral_status.count, referral_status.count_patients_with_morethan_1_encounters,
        referral_status.dummy, referral_status.patient_uuid]
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
    - model: analytics_qa
      explore: referral_status
      type: table
      fields: [referral_status.dummy, referral_status.total_patients_count]
      sorts: [referral_status.total_patients_count desc]
      limit: 500
      join_fields:
      - field_name: referral_status.dummy
        source_field_name: referral_status.dummy
    hidden_fields: [referral_status.patient_uuid, referral_status.dummy, referral_status.count_patients_with_morethan_1_encounters,
      referral_status.count, more_than_1_encounters, referral_status.total_patients_count]
    type: single_value
    series_types: {}
    dynamic_fields: [{table_calculation: patients_with_1_encounters, label: "% Patients\
          \ with 1+ encounters", expression: "${more_than_1_encounters}/${referral_status.total_patients_count}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    - Referral Partner: referral_status.referral_partner
      Referral Channel: referral_status.referral_channel
    row: 31
    col: 12
    width: 7
    height: 3
  - title: Outreach types over time
    name: Outreach types over time
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.date_of_service_month, referral_status.total_number_of_email_outreaches,
      referral_status.total_number_of_phone_outreaches]
    fill_fields: [referral_status.date_of_service_month]
    filters:
      referral_status.date_of_service_month: 9 months
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
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 51
    col: 0
    width: 8
    height: 6
  - title: Patient funnel (over the past 10 months)
    name: Patient funnel (over the past 10 months)
    model: analytics_qa
    explore: referral_status
    type: looker_funnel
    fields: [referral_status.total_patients_count, referral_status.count_patients_with_outreach,
      referral_status.count_patients_with_appointment, referral_status.count_patients_with_order,
      referral_status.count_patients_with_ror, referral_status.count_patients_with_result_sent]
    filters:
      referral_status.original_referral_date_month: 10 months
    limit: 500
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
      options:
        steps: 5
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
    series_types: {}
    row: 51
    col: 8
    width: 15
    height: 10
  filters:
  - name: Referral Partner
    title: Referral Partner
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: analytics_qa
    explore: referral_status
    listens_to_filters: []
    field: referral_status.referral_partner
  - name: Referral Channel
    title: Referral Channel
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: analytics_qa
    explore: referral_status
    listens_to_filters: []
    field: referral_status.referral_channel
