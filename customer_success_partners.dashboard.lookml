- dashboard: customer_success_partners
  title: 'CS Partner Dashboard (Prod): Referrals, Outreach & Encounter Status'
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: All-Time Completed Encounters
    name: All-Time Completed Encounters
    model: customer_success_prod
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
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 0
    col: 12
    width: 12
    height: 3
  - title: Completed Encounters MTD
    name: Completed Encounters MTD
    model: customer_success_prod
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
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 3
    col: 12
    width: 12
    height: 3
  - title: "% of Appts Booked"
    name: "% of Appts Booked"
    model: customer_success_prod
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
    y_axes: [{label: "% of Appointments Booked", orientation: left, series: [{axisId: No
              - distinct_encounter_count, id: No - distinct_encounter_count, name: Appointment
              booked in 2+ Days}, {axisId: Yes - distinct_encounter_count, id: Yes
              - distinct_encounter_count, name: Appointment booked within 2 days}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Referral Month
    hidden_series: []
    font_size: ''
    series_types: {}
    series_colors:
      Yes - distinct_encounter_count: "#C2DD67"
      No - distinct_encounter_count: "#4276BE"
    series_labels:
      Yes - distinct_encounter_count: Appointment booked within 2 days
      No - distinct_encounter_count: Appointment booked in 2+ Days
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#04C220",
        line_value: ".9", label: GOAL}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [encounter_scheduled_within_7_days_count]
    note_state: expanded
    note_display: above
    note_text: Within 2 Days of Referral
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 40
    col: 0
    width: 12
    height: 7
  - title: "# of Outreach Attempts"
    name: "# of Outreach Attempts"
    model: customer_success_prod
    explore: referral_status
    type: looker_pie
    fields: [referral_status.number_of_outreaches_before_encounter_creation, referral_status.count]
    filters:
      referral_status.encounter_uuid: "-NULL"
      referral_status.number_of_outreaches_before_encounter_creation: "<7,NOT NULL"
      referral_status.encounter_type: visit
      referral_status.is_first_visit_encounter: 'Yes'
    sorts: [referral_status.number_of_outreaches_before_encounter_creation]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 53f185d2-c73c-4aa7-9b3e-c56a440c3743
      options:
        steps: 5
    series_colors: {}
    series_labels:
      '1': 1st Outreach
      '2': 2nd Outreach
      '3': 3rd Outreach
      '4': 4th Outreach
      '5': 5th Outreach
      '6': 6th Outreach
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
    note_state: expanded
    note_display: above
    note_text: Before Initial Encounter Booked
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 49
    col: 10
    width: 7
    height: 6
  - title: New Tile
    name: New Tile
    model: customer_success_prod
    explore: referral_status
    type: single_value
    fields: [referral_status.count_encounters]
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
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 0
    col: 0
    width: 12
    height: 3
  - title: Referrals MTD
    name: Referrals MTD
    model: customer_success_prod
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
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 3
    col: 0
    width: 12
    height: 3
  - title: "% of Encounters"
    name: "% of Encounters"
    model: customer_success_prod
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
    y_axes: [{label: "% of Encounters", orientation: left, series: [{axisId: No -
              distinct_encounter_count, id: No - distinct_encounter_count, name: Encounter
              Completed &gt;10 Days After Referral}, {axisId: Yes - distinct_encounter_count,
            id: Yes - distinct_encounter_count, name: Encounter Completed Within 10
              Days of Referral}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Referral Month
    hidden_series: []
    font_size: ''
    series_types: {}
    series_colors:
      Yes - distinct_encounter_count: "#C2DD67"
      No - distinct_encounter_count: "#4276BE"
    series_labels:
      Yes - distinct_encounter_count: Encounter Completed Within 10 Days of Referral
      No - distinct_encounter_count: Encounter Completed >10 Days After Referral
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#04C220",
        line_value: ".9", label: GOAL}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [encounter_scheduled_within_7_days_count]
    note_state: expanded
    note_display: above
    note_text: Completed Within 10 Days of Referral
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 34
    col: 0
    width: 24
    height: 6
  - title: "% of Encounters Completed"
    name: "% of Encounters Completed"
    model: customer_success_prod
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
    y_axes: [{label: "% of Encounters", orientation: left, series: [{axisId: No -
              distinct_encounter_count, id: No - distinct_encounter_count, name: Encounters
              Completed  &gt;5 Days From Scheduling}, {axisId: Yes - distinct_encounter_count,
            id: Yes - distinct_encounter_count, name: Encounters Completed Within
              5 Days From Scheduling}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Referral Month
    font_size: ''
    series_types: {}
    series_colors:
      Yes - distinct_encounter_count: "#C2DD67"
      No - distinct_encounter_count: "#4276BE"
    series_labels:
      Yes - distinct_encounter_count: Encounters Completed Within 5 Days From Scheduling
      No - distinct_encounter_count: Encounters Completed  >5 Days From Scheduling
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#04C220",
        line_value: ".9", label: GOAL}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [encounter_scheduled_within_7_days_count]
    note_state: expanded
    note_display: above
    note_text: " Within 5 Days of Scheduling"
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 40
    col: 12
    width: 12
    height: 7
  - title: "% of Patients Requiring <2 Initial Outreach Attempts"
    name: "% of Patients Requiring <2 Initial Outreach Attempts"
    model: customer_success_prod
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
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 53f185d2-c73c-4aa7-9b3e-c56a440c3743
      options:
        steps: 5
        reverse: false
    y_axes: [{label: "% of Outreach Attempts", orientation: left, series: [{axisId: No
              - referral_status.count_encounters, id: No - referral_status.count_encounters,
            name: More Than 2 Outreach Attempts}, {axisId: Yes - referral_status.count_encounters,
            id: Yes - referral_status.count_encounters, name: 2 or Less Outreach Attempts}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Referral Month
    series_types: {}
    series_colors:
      Yes - referral_status.count_encounters: "#74A09F"
    series_labels:
      '1': 1 outreach before Visit Scheduled
      '2': 2 outreaches before before Visit Scheduled
      '3': 3 outreaches before before Visit Scheduled
      '4': 4 outreaches before before Visit Scheduled
      '5': 5 outreaches before Visit Scheduled
      '6': 6 outreaches before Visit Scheduled
      No - referral_status.count_encounters: More Than 2 Outreach Attempts
      Yes - referral_status.count_encounters: 2 or Less Outreach Attempts
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 55
    col: 10
    width: 14
    height: 6
  - title: Unscheduled Referrals (All Time)
    name: Unscheduled Referrals (All Time)
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.visit_status_grouped, referral_status.count, referral_status.visit_status]
    pivots: [referral_status.visit_status]
    filters:
      referral_status.visit_status_grouped: Scheduled/Rescheduled,Did not schedule
      referral_status.encounter_type: visit,cc-intake,group-session,NULL
    sorts: [referral_status.visit_status_grouped desc, referral_status.visit_status]
    limit: 500
    x_axis_gridlines: false
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
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 87654122-8144-4720-8259-82ac9908d5f4
      options:
        steps: 5
    series_colors:
      Booked - referral_status.count: "#25435A"
      Cancelled Rescheduled By Patient - referral_status.count: "#79D0CC"
      Cancelled Rescheduled By Provider - referral_status.count: "#D5DB61"
      referral_status.visit_status___null - referral_status.count: "#FFEB8E"
      " - referral_status.count": "#2B797D"
    series_labels:
      referral_status.visit_status___null - referral_status.count: Did Not Schedule
      Cancelled Rescheduled By Patient - referral_status.count: Rescheduled by Patient
      Cancelled Rescheduled By Provider - referral_status.count: Rescheduled by Provider
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 27
    col: 12
    width: 12
    height: 7
  - title: Visit Encounter Status
    name: Visit Encounter Status
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.count_encounters, referral_status.original_referral_date_quarter,
      referral_status.visit_status_grouped]
    pivots: [referral_status.visit_status_grouped]
    fill_fields: [referral_status.original_referral_date_quarter]
    filters:
      referral_status.original_referral_date_quarter: 5 quarters
      referral_status.encounter_type: visit
    sorts: [referral_status.original_referral_date_quarter desc, referral_status.visit_status_grouped]
    limit: 100
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
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 0cc9e709-0004-4166-adc2-c979c6a55ca0
      options:
        steps: 5
        reverse: true
    y_axes: [{label: Visit Encounter Count, orientation: left, series: [{axisId: Cancelled/No-show
              - referral_status.count_encounters, id: Cancelled/No-show - referral_status.count_encounters,
            name: Cancelled/No-show}, {axisId: Completed - referral_status.count_encounters,
            id: Completed - referral_status.count_encounters, name: Completed}, {
            axisId: Scheduled/Rescheduled - referral_status.count_encounters, id: Scheduled/Rescheduled
              - referral_status.count_encounters, name: Scheduled/Rescheduled}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Referral Date Quarter
    hidden_series: []
    hide_legend: false
    font_size: '10'
    series_types: {}
    series_colors:
      Cancelled/No-show - referral_status.count_encounters: "#7363A9"
      Completed - referral_status.count_encounters: "#4276BE"
      Scheduled/Rescheduled - referral_status.count_encounters: "#3FB0D5"
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
    note_display: above
    note_text: Quarterly
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 13
    col: 12
    width: 12
    height: 7
  - title: "% of Declined Outreach"
    name: "% of Declined Outreach"
    model: customer_success_prod
    explore: referral_status
    type: looker_pie
    fields: [referral_status.count, referral_status.patient_outreach_setting_enabled]
    fill_fields: [referral_status.patient_outreach_setting_enabled]
    filters: {}
    sorts: [referral_status.patient_outreach_setting_enabled desc]
    limit: 13
    column_limit: 50
    value_labels: legend
    label_type: labVal
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 94ff10f1-bc18-49e3-9172-d166ad160bf5
      options:
        steps: 5
        reverse: true
    series_colors:
      'No': "#74A09F"
      'Yes': "#EBC667"
    series_labels:
      No - referral_status.count: Patient Declined Outreach
      Yes - referral_status.count: Patient Did Not Decline Outreach
      'No': Patient Declined Outreach
      'Yes': Patient Did Not Decline Outreach
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
    y_axes: [{label: "% of Referred Patients", orientation: left, series: [{axisId: No
              - referral_status.count, id: No - referral_status.count, name: Patient
              Declined Outreach}, {axisId: Yes - referral_status.count, id: Yes -
              referral_status.count, name: Patient Approved Outreach}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '10'
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: " (All Time)"
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 49
    col: 17
    width: 7
    height: 6
  - title: Monthly Encounters
    name: Monthly Encounters
    model: customer_success_prod
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
    y_axes: [{label: "# of Encounters", orientation: left, series: [{axisId: Get Started
              - No Results - referral_status.count_encounters, id: Get Started - No
              Results - referral_status.count_encounters, name: Get Started - w/o
              Results}, {axisId: Get Started - w/Results - referral_status.count_encounters,
            id: Get Started - w/Results - referral_status.count_encounters, name: Get
              Started - w/Results}, {axisId: OTHERS - referral_status.count_encounters,
            id: OTHERS - referral_status.count_encounters, name: Others}, {axisId: Return
              of Results - referral_status.count_encounters, id: Return of Results
              - referral_status.count_encounters, name: Return of Results}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Encounter Month
    hide_legend: false
    font_size: '10'
    series_types: {}
    series_colors:
      Get Started - w/Results - referral_status.count_encounters: "#B1399E"
      OTHERS - referral_status.count_encounters: "#4276BE"
      Return of Results - referral_status.count_encounters: "#C2DD67"
      Get Started - No Results - referral_status.count_encounters: "#592EC2"
    series_labels:
      OTHERS - referral_status.count_encounters: Others
      Get Started - No Results - referral_status.count_encounters: Get Started - w/o
        Results
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
    note_state: expanded
    note_display: above
    note_text: by Consultation Type
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 6
    col: 12
    width: 12
    height: 7
  - title: Encounter Status (All Time)
    name: Encounter Status (All Time)
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.visit_status, referral_status.visit_status_grouped, referral_status.count]
    pivots: [referral_status.visit_status]
    filters:
      referral_status.visit_status_grouped: Cancelled/No-show,Scheduled/Rescheduled
    sorts: [referral_status.count desc 0, referral_status.visit_status]
    limit: 500
    x_axis_gridlines: false
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
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: 6b363a0e-c6fa-4887-8952-5456fdfdf919
      options:
        steps: 5
    y_axes: [{label: Encounters, orientation: left, series: [{axisId: Booked - referral_status.count,
            id: Booked - referral_status.count, name: Booked}, {axisId: Cancelled
              - referral_status.count, id: Cancelled - referral_status.count, name: Cancelled},
          {axisId: Cancelled By Care Coordinator - referral_status.count, id: Cancelled
              By Care Coordinator - referral_status.count, name: Cancelled By Care
              Coordinator}, {axisId: Cancelled By Patient - referral_status.count,
            id: Cancelled By Patient - referral_status.count, name: Cancelled By Patient},
          {axisId: Cancelled By Provider - referral_status.count, id: Cancelled By
              Provider - referral_status.count, name: Cancelled By Provider}, {axisId: Cancelled
              Rescheduled By Patient - referral_status.count, id: Cancelled Rescheduled
              By Patient - referral_status.count, name: Cancelled Rescheduled By Patient},
          {axisId: Cancelled Rescheduled By Provider - referral_status.count, id: Cancelled
              Rescheduled By Provider - referral_status.count, name: Cancelled Rescheduled
              By Provider}, {axisId: No Show - referral_status.count, id: No Show
              - referral_status.count, name: No Show}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors: {}
    series_labels:
      Cancelled Rescheduled By Patient - referral_status.count: Rescheduled by Patient
      Cancelled Rescheduled By Provider - referral_status.count: Rescheduled by Provider
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 27
    col: 0
    width: 12
    height: 7
  - title: Top 10 Payor Sources
    name: Top 10 Payor Sources
    model: customer_success_prod
    explore: referral_status
    type: looker_pie
    fields: [completed_encounters.payor, completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.payor: "-NULL"
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 11
    total: true
    dynamic_fields: [{_kind_hint: dimension, table_calculation: top_10_payors_with_other,
        _type_hint: string, category: table_calculation, expression: "if (\n  row()\
          \ != max(row())\n    ,${completed_encounters.payor}\n    ,\"Other\"\n  \
          \  \n)", label: Top 10 Payors with Other, value_format: !!null '', value_format_name: !!null ''},
      {_kind_hint: measure, table_calculation: top_10_encounters_count_with_other,
        _type_hint: number, category: table_calculation, expression: "if(\n# For rows\
          \ other than the last row\n row() != max(row()) \n# Display event count\n\
          \ ,${completed_encounters.count_completed_encounters}\n# For the last row,\
          \ display total event count from all rows above this one\n , ${completed_encounters.count_completed_encounters:total}\
          \ - sum( if(row()= max(row()) , 0 , ${completed_encounters.count_completed_encounters})\
          \ )\n)", label: Top 10 Encounters Count with Other, value_format: !!null '',
        value_format_name: !!null ''}]
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: ed5756e2-1ba8-4233-97d2-d565e309c03b
      palette_id: c0a26a97-018c-4b6a-9f39-b15008a3f4a5
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
    hidden_fields: [completed_encounters.payor, completed_encounters.count_completed_encounters]
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 20
    col: 12
    width: 12
    height: 7
  - title: Provider Indicated Specialty
    name: Provider Indicated Specialty
    model: customer_success_prod
    explore: completed_encounters
    type: looker_pie
    fields: [completed_encounters.provider_indicated_specialty, completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.provider_indicated_specialty: "-NULL,-EMPTY"
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: ca5bc734-c8e2-489d-a00e-48c321885a14
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
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
      Referral Channel: completed_encounters.referral_channel
    row: 20
    col: 0
    width: 12
    height: 7
  - title: Patients Referred vs Completed Encounters
    name: Patients Referred vs Completed Encounters
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.original_referral_date_month, referral_status.count,
      completed_encounters.count_completed_encounters]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 6 months
      referral_status.encounter_uuid: "-NULL"
    sorts: [referral_status.original_referral_date_month]
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
    point_style: circle
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
      collection_id: 6c27c30e-5523-4080-82ae-272146e699d0
      palette_id: ca5bc734-c8e2-489d-a00e-48c321885a14
      options:
        steps: 5
    x_axis_label: Referral Month
    series_types:
      referral_status.count_patients_with_encounters: line
      completed_encounters.count_completed_encounters: line
    series_colors: {}
    series_labels:
      referral_status.count: Referrals
      completed_encounters.count_completed_encounters: Completed Encounters
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Monthly
    listen:
      Referral Partner: completed_encounters.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 6
    col: 0
    width: 12
    height: 7
  - title: "# of Outreach Attempts Before Scheduling"
    name: "# of Outreach Attempts Before Scheduling"
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [referral_status.number_of_outreaches_before_encounter_creation, referral_status.count,
      referral_status.original_referral_date_month]
    pivots: [referral_status.number_of_outreaches_before_encounter_creation]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.encounter_uuid: "-NULL"
      referral_status.number_of_outreaches_before_encounter_creation: "<7,NOT NULL"
      referral_status.encounter_type: visit
      referral_status.is_first_visit_encounter: 'Yes'
      referral_status.original_referral_date_month: 3 months
    sorts: [referral_status.number_of_outreaches_before_encounter_creation, referral_status.original_referral_date_month
        desc]
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
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 53f185d2-c73c-4aa7-9b3e-c56a440c3743
      options:
        steps: 5
    y_axes: [{label: Number of Outreach Attempts, orientation: left, series: [{axisId: referral_status.count,
            id: 1 - referral_status.count, name: 1st Outreach}, {axisId: referral_status.count,
            id: 2 - referral_status.count, name: 2nd Outreach}, {axisId: referral_status.count,
            id: 3 - referral_status.count, name: 3rd Outreach}, {axisId: referral_status.count,
            id: 4 - referral_status.count, name: 4th Outreach}, {axisId: referral_status.count,
            id: 5 - referral_status.count, name: 5th Outreach}, {axisId: referral_status.count,
            id: 6 - referral_status.count, name: 6th Outreach}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Outreach Month
    series_types: {}
    series_colors: {}
    series_labels:
      '1': 1st Outreach
      '2': 2nd Outreach
      '3': 3rd Outreach
      '4': 4th Outreach
      '5': 5th Outreach
      '6': 6th Outreach
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 49
    col: 0
    width: 10
    height: 12
  - title: 'Patient Visit Status '
    name: 'Patient Visit Status '
    model: customer_success_prod
    explore: referral_status
    type: looker_bar
    fields: [referral_status.count, referral_status.visit_status_grouped]
    sorts: [referral_status.count desc, referral_status.visit_status_grouped]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 0cc9e709-0004-4166-adc2-c979c6a55ca0
      options:
        steps: 5
        reverse: true
    y_axes: [{label: "# of Encounters", orientation: bottom, series: [{axisId: referral_status.count,
            id: referral_status.count, name: Referral Status}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Visit Status
    font_size: '12'
    series_types: {}
    series_colors:
      referral_status.count: "#44759A"
    series_labels:
      Completed: Completed Visit Encounter
      Scheduled/Rescheduled: Visit Booked
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    note_state: expanded
    note_display: above
    note_text: All Time
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 13
    col: 0
    width: 12
    height: 7
  - name: OUTREACH
    type: text
    title_text: OUTREACH
    subtitle_text: ''
    body_text: ''
    row: 47
    col: 0
    width: 24
    height: 2
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
    model: customer_success_prod
    explore: referral_status
    listens_to_filters: [Referral Program, Referral Channel]
    field: referral_status.referral_partner
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
    model: customer_success_prod
    explore: referral_status
    listens_to_filters: [Referral Partner, Referral Channel]
    field: referral_status.referral_program
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
    model: customer_success_prod
    explore: referral_status
    listens_to_filters: [Referral Partner, Referral Program]
    field: referral_status.referral_channel
