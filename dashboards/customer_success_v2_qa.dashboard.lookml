- dashboard: cs_referral_status__partner_dashboard_v2_qa
  title: CS Partner Dashboard v2 (QA)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
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
    legend_position: center
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
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: "% of Referred Patients", orientation: left, series: [{axisId: No
              - referral_status.count, id: No - referral_status.count, name: Patient
              Declined Outreach}, {axisId: Yes - referral_status.count, id: Yes -
              referral_status.count, name: Patient Approved Outreach}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '10'
    series_types: {}
    series_colors:
      No - referral_status.count: "#4A80BC"
      Yes - referral_status.count: "#615894"
    series_labels:
      No - referral_status.count: Patient Declined Outreach
      Yes - referral_status.count: Patient Did Not Decline Outreach
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 26
    col: 0
    width: 12
    height: 8
  - title: All-Time Completed Encounters
    name: All-Time Completed Encounters
    model: analytics_qa
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.encounter_uuid: "-NULL"
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Partner: completed_encounters.referral_partner
    row: 48
    col: 17
    width: 7
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Partner: completed_encounters.referral_partner
    row: 52
    col: 17
    width: 7
    height: 4
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
    row: 46
    col: 0
    width: 24
    height: 2
  - name: Outreach
    type: text
    title_text: Outreach
    subtitle_text: ''
    body_text: ''
    row: 24
    col: 0
    width: 23
    height: 2
  - title: Test Recommendations, by Referral Month
    name: Test Recommendations, by Referral Month
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [encounters_count, referral_status.test_recommended, referral_status.original_referral_date_month]
    pivots: [referral_status.test_recommended]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 6 months
    sorts: [encounters_count desc 0, referral_status.test_recommended]
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
    show_totals_labels: true
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
    series_labels:
      referral_status.test_recommended___null - encounters_count: N/A
      No - encounters_count: Test NOT recommended
      Yes - encounters_count: Test recommended
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 56
    col: 0
    width: 12
    height: 7
  - title: "% of Appointments Scheduled in 2 days (referral -> scheduling)"
    name: "% of Appointments Scheduled in 2 days (referral -> scheduling)"
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 18
    col: 0
    width: 12
    height: 6
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
    y_axes: [{label: Visit Encounter Types, orientation: left, series: [{axisId: Get
              Started - No Results - referral_status.count_encounters, id: Get Started
              - No Results - referral_status.count_encounters, name: Get Started -
              No Results}, {axisId: Get Started - w/Results - referral_status.count_encounters,
            id: Get Started - w/Results - referral_status.count_encounters, name: Get
              Started - w/Results}, {axisId: OTHERS - referral_status.count_encounters,
            id: OTHERS - referral_status.count_encounters, name: OTHERS}, {axisId: Return
              of Results - referral_status.count_encounters, id: Return of Results
              - referral_status.count_encounters, name: Return of Results}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Encounter Month
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 48
    col: 0
    width: 9
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 63
    col: 12
    width: 12
    height: 7
  - title: Outreaches Before Initial Appointment Scheduling
    name: Outreaches Before Initial Appointment Scheduling
    model: analytics_qa
    explore: referral_status
    type: looker_pie
    fields: [referral_status.number_of_outreaches_before_encounter_creation, referral_status.count]
    filters:
      referral_status.encounter_uuid: "-NULL"
      referral_status.number_of_outreaches_before_encounter_creation: NOT NULL
      referral_status.encounter_type: visit
      referral_status.is_first_visit_encounter: 'Yes'
    sorts: [referral_status.number_of_outreaches_before_encounter_creation]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 40
    col: 0
    width: 12
    height: 6
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 63
    col: 0
    width: 12
    height: 7
  - title: Outreach types over time
    name: Outreach types over time
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [patient_communication_details.communication_type_display_name, patient_communication_details.count,
      patient_communication_details.communication_medium_display_name]
    pivots: [patient_communication_details.communication_medium_display_name]
    filters:
      patient_communication_details.communication_type_display_name: "-NULL"
    sorts: [patient_communication_details.communication_medium_display_name, patient_communication_details.count
        desc 0]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    x_axis_label: Communication Medium
    hidden_series: []
    font_size: '12'
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields:
    value_labels: legend
    label_type: labPer
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
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 26
    col: 12
    width: 11
    height: 8
  - title: Quarterly Visit Encounter Status
    name: Quarterly Visit Encounter Status
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.count_encounters, referral_status.original_referral_date_quarter,
      referral_status.visit_status]
    pivots: [referral_status.visit_status]
    fill_fields: [referral_status.original_referral_date_quarter]
    filters:
      referral_status.original_referral_date_quarter: 5 quarters
      referral_status.encounter_type: visit
    sorts: [referral_status.original_referral_date_quarter desc, referral_status.visit_status]
    limit: 100
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
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 53f185d2-c73c-4aa7-9b3e-c56a440c3743
      options:
        steps: 5
    y_axes: [{label: Vist Encounter Count, orientation: left, series: [{axisId: booked
              - referral_status.count_encounters, id: booked - referral_status.count_encounters,
            name: Appt Booked}, {axisId: cancelled_by_care_coordinator - referral_status.count_encounters,
            id: cancelled_by_care_coordinator - referral_status.count_encounters,
            name: Cancelled - by Care Coordinator}, {axisId: cancelled_by_patient
              - referral_status.count_encounters, id: cancelled_by_patient - referral_status.count_encounters,
            name: Cancelled - by Patient}, {axisId: cancelled_by_provider - referral_status.count_encounters,
            id: cancelled_by_provider - referral_status.count_encounters, name: Cancelled
              - by Provider}, {axisId: cancelled_rescheduled_by_patient - referral_status.count_encounters,
            id: cancelled_rescheduled_by_patient - referral_status.count_encounters,
            name: Cancelled &amp; Rescheduled - by Patient}, {axisId: cancelled_rescheduled_by_provider
              - referral_status.count_encounters, id: cancelled_rescheduled_by_provider
              - referral_status.count_encounters, name: Cancelled &amp; Rescheduled
              - by Provider}, {axisId: completed - referral_status.count_encounters,
            id: completed - referral_status.count_encounters, name: Completed Appt},
          {axisId: no_show - referral_status.count_encounters, id: no_show - referral_status.count_encounters,
            name: Patient No-Show}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: []
    hide_legend: false
    font_size: '10'
    series_types: {}
    series_colors: {}
    series_labels:
      Status unknown - referral_status.count_encounters: Status currently unknown
      referral_status.visit_status___null - referral_status.count_encounters: no_data
      booked - referral_status.count_encounters: Appt Booked
      cancelled_by_care_coordinator - referral_status.count_encounters: Cancelled
        - by Care Coordinator
      cancelled_by_patient - referral_status.count_encounters: Cancelled - by Patient
      cancelled_by_provider - referral_status.count_encounters: Cancelled - by Provider
      cancelled_rescheduled_by_patient - referral_status.count_encounters: Cancelled
        & Rescheduled - by Patient
      cancelled_rescheduled_by_provider - referral_status.count_encounters: Cancelled
        & Rescheduled - by Provider
      completed - referral_status.count_encounters: Completed Appt
      no_show - referral_status.count_encounters: Patient No-Show
      webinar_attended - referral_status.count_encounters: Webinar Attended
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
    note_state: collapsed
    note_display: hover
    note_text: A visit is defined as a 1:1 GC appointment.
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 2
    col: 5
    width: 18
    height: 8
  - title: Patients with at least one encounter
    name: Patients with at least one encounter
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.total_patients_count, referral_status.count_patients_with_encounters]
    sorts: [referral_status.total_patients_count desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: encounterless_patients,
        _type_hint: number, category: table_calculation, expression: "${referral_status.total_patients_count}-${referral_status.count_patients_with_encounters}",
        label: Encounterless Patients, value_format: !!null '', value_format_name: decimal_0}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: false
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
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
      palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
      options:
        steps: 5
    x_axis_label: "% of Registered Patients"
    hide_legend: false
    font_size: '12'
    series_types: {}
    series_colors: {}
    series_labels:
      referral_status.total_patients_count: Total registered patients
      referral_status.count_patients_with_encounters: Patients with at least one encounter
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
    value_labels: legend
    label_type: labPer
    show_null_points: true
    hidden_fields: [referral_status.total_patients_count]
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 48
    col: 9
    width: 8
    height: 8
  - title: New Tile
    name: New Tile
    model: analytics_qa
    explore: referral_status
    type: single_value
    fields: [referral_status.count_encounters]
    filters: {}
    sorts: [referral_status.count_encounters desc]
    limit: 500
    total: true
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 2
    col: 0
    width: 5
    height: 4
  - title: MTD
    name: MTD
    model: analytics_qa
    explore: referral_status
    type: single_value
    fields: [referral_status.count, referral_status.original_referral_date_month]
    pivots: [referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 2 months
      referral_status.is_original_referral_date_before_mtd: 'Yes'
    sorts: [referral_status.original_referral_date_month desc, referral_status.count
        desc 0]
    limit: 500
    total: true
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: mtd_difference,
        _type_hint: number, category: table_calculation, expression: 'pivot_index(${referral_status.count},1)
          - pivot_index(${referral_status.count},2)', label: MTD Difference, value_format: !!null '',
        value_format_name: !!null ''}]
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
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 6
    col: 0
    width: 5
    height: 4
  - title: "% of Visits completed within 10 days of referral (referral -> visit complete)"
    name: "% of Visits completed within 10 days of referral (referral -> visit complete)"
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, distinct_encounter_count,
      visit_in_10_days_or_less]
    pivots: [visit_in_10_days_or_less]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 6 months
      referral_status.is_first_visit_encounter: 'Yes'
      referral_status.is_first_visit_completed_encounter: 'Yes'
    sorts: [referral_status.original_referral_date_month desc, visit_in_10_days_or_less]
    limit: 500
    dynamic_fields: [{measure: distinct_encounter_count, based_on: referral_status.encounter_uuid,
        type: count_distinct, label: Distinct Encounter Count, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: scheduled_in_2_days, label: "% Scheduled\
          \ in 2 Days", expression: "${encounter_scheduled_within_2_days_count}/${distinct_encounter_count}",
        value_format: !!null '', value_format_name: percent_0, is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {dimension: visit_in_10_days_or_less,
        _kind_hint: dimension, _type_hint: yesno, category: dimension, expression: "${referral_status.referral_to_date_of_service_time}\
          \ <=10", label: 'Visit in 10 days or less?', value_format: !!null '', value_format_name: !!null ''},
      {measure: encounter_scheduled_within_2_days_count, based_on: referral_status.encounter_uuid,
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
    y_axes: [{label: Percentage of Visits, orientation: left, series: [{axisId: No
              - distinct_encounter_count, id: No - distinct_encounter_count, name: Appointment
              scheduled in over 2 days}, {axisId: Yes - distinct_encounter_count,
            id: Yes - distinct_encounter_count, name: Appointment scheduled within
              2 days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: []
    font_size: '10'
    series_types: {}
    series_labels:
      Yes - distinct_encounter_count: Visit within 10 days of referral
      No - distinct_encounter_count: Visit >10 days after referral
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#72D16D",
        line_value: ".9", label: GOAL}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [encounter_scheduled_within_7_days_count]
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 10
    col: 0
    width: 23
    height: 8
  - title: "% of Completed Visits within 5 days of scheduling (scheduling -> visit\
      \ complete)"
    name: "% of Completed Visits within 5 days of scheduling (scheduling -> visit\
      \ complete)"
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, distinct_encounter_count,
      appointment_within_5_days_of_scheduling]
    pivots: [appointment_within_5_days_of_scheduling]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 6 months
      referral_status.is_first_visit_encounter: 'Yes'
      referral_status.is_first_visit_completed_encounter: 'Yes'
    sorts: [referral_status.original_referral_date_month desc, appointment_within_5_days_of_scheduling]
    limit: 500
    dynamic_fields: [{measure: distinct_encounter_count, based_on: referral_status.encounter_uuid,
        type: count_distinct, label: Distinct Encounter Count, expression: !!null '',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: scheduled_in_2_days, label: "% Scheduled\
          \ in 2 Days", expression: "${encounter_scheduled_within_2_days_count}/${distinct_encounter_count}",
        value_format: !!null '', value_format_name: percent_0, is_disabled: true,
        _kind_hint: measure, _type_hint: number}, {dimension: appointment_within_5_days_of_scheduling,
        _kind_hint: dimension, _type_hint: yesno, category: dimension, expression: "${referral_status.creation_to_date_of_service_time}\
          \ <=5", label: 'Appointment within 5 days of scheduling?', value_format: !!null '',
        value_format_name: !!null ''}, {measure: encounter_scheduled_within_2_days_count,
        based_on: referral_status.encounter_uuid, type: count_distinct, label: Encounter
          Scheduled Within 2 Days Count, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: "${scheduled_in_under_2_days}\
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
    y_axes: [{label: Percentage of Visits, orientation: left, series: [{axisId: No
              - distinct_encounter_count, id: No - distinct_encounter_count, name: Appointment
              scheduled in over 2 days}, {axisId: Yes - distinct_encounter_count,
            id: Yes - distinct_encounter_count, name: Appointment scheduled within
              2 days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    font_size: '10'
    series_types: {}
    series_labels:
      Yes - distinct_encounter_count: Visits completed within 5 days from scheduling
      No - distinct_encounter_count: Visits >5 days from scheduling
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#72D16D",
        line_value: ".9", label: GOAL}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [encounter_scheduled_within_7_days_count]
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 18
    col: 12
    width: 11
    height: 6
  - title: Outreach types over time
    name: Outreach types over time (2)
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [patient_communication_details.count, communication_type, patient_communication_details.date_month]
    pivots: [communication_type]
    fill_fields: [patient_communication_details.date_month]
    filters:
      patient_communication_details.communication_type_display_name: "-NULL"
      patient_communication_details.date_month: 6 months
    sorts: [patient_communication_details.count desc 0, communication_type]
    limit: 500
    dynamic_fields: [{dimension: communication_type, _kind_hint: measure, _type_hint: string,
        category: dimension, expression: 'concat(${patient_communication_details.communication_type_display_name},
          " - ", ${patient_communication_details.communication_medium_display_name})',
        label: Communication Type, value_format: !!null '', value_format_name: !!null ''}]
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    x_axis_label: Communication Medium
    hidden_series: []
    font_size: '12'
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    value_labels: legend
    label_type: labPer
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
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 34
    col: 0
    width: 23
    height: 6
  - title: "% of Patients Requiring <2 Outreaches"
    name: "% of Patients Requiring <2 Outreaches"
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [2_or_less_outreaches, referral_status.count_encounters, referral_status.original_referral_date_month]
    pivots: [2_or_less_outreaches]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.encounter_uuid: "-NULL"
      referral_status.number_of_outreaches_before_encounter_creation: NOT NULL
      referral_status.encounter_type: visit
      referral_status.is_first_visit_encounter: 'Yes'
      referral_status.original_referral_date_month: 6 months
    sorts: [referral_status.original_referral_date_month desc, 2_or_less_outreaches]
    limit: 500
    dynamic_fields: [{dimension: 2_or_less_outreaches, _kind_hint: dimension, _type_hint: yesno,
        category: dimension, expression: "${referral_status.number_of_outreaches_before_encounter_creation}\
          \ <=2", label: '2 or less outreaches?', value_format: !!null '', value_format_name: !!null ''}]
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 75905e81-dadc-472c-b9a2-a201f788d55d
      options:
        steps: 5
    y_axes: [{label: Encounters, orientation: left, series: [{axisId: No - referral_status.count_encounters,
            id: No - referral_status.count_encounters, name: 'No'}, {axisId: Yes -
              referral_status.count_encounters, id: Yes - referral_status.count_encounters,
            name: 'Yes'}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    series_labels:
      '1': 1 outreach before Visit Scheduled
      '2': 2 outreaches before before Visit Scheduled
      '3': 3 outreaches before before Visit Scheduled
      '4': 4 outreaches before before Visit Scheduled
      '5': 5 outreaches before Visit Scheduled
      '6': 6 outreaches before Visit Scheduled
      No - referral_status.count_encounters: More than 2 outreaches
      Yes - referral_status.count_encounters: 2 or less outreaches
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 40
    col: 12
    width: 11
    height: 6
  - title: Test Orders Status, by Month Ordered
    name: Test Orders Status, by Month Ordered
    model: analytics_qa
    explore: referral_status
    type: looker_column
    fields: [encounters_count, gene_test_orders.order_status_display_name, gene_test_orders.date_test_ordered_month]
    pivots: [gene_test_orders.order_status_display_name]
    fill_fields: [gene_test_orders.date_test_ordered_month]
    filters:
      gene_test_orders.order_status_display_name: "-N/A"
      gene_test_orders.date_test_ordered_month: 6 months
    sorts: [gene_test_orders.order_status_display_name, gene_test_orders.date_test_ordered_month
        desc]
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
    show_totals_labels: true
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
    series_labels:
      referral_status.test_recommended___null - encounters_count: N/A
      No - encounters_count: Test NOT recommended
      Yes - encounters_count: Test recommended
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
    row: 56
    col: 12
    width: 12
    height: 7
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
