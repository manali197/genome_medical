- dashboard: customer_success_internal
  title: 'CS Internal Dashboard (Prod)'
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 2021 Active Referral Partners
    name: 2021 Active Referral Partners
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_grid
    fields: [completed_encounters.referral_partner, completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 100
    column_limit: 100
    total: true
    dynamic_fields: [{table_calculation: referral_program_with_other, label: Referral
          Program with Other, expression: "if(\n# For rows other than the last row\n\
          \ row() != max(row()) \n# Display event name\n ,${completed_encounters.referral_program}\n\
          # For the last row, display \"Other\"\n , \"Other\"\n)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string, is_disabled: true}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: 4dadd4d2-40af-451b-bcdd-1dfaedf76163
      options:
        steps: 5
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      completed_encounters.referral_partner: left
    column_order: ["$$$_row_numbers_$$$", completed_encounters.referral_partner, completed_encounters.count_completed_encounters]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      completed_encounters.count_completed_encounters: 253
      completed_encounters.referral_partner: 196
    series_cell_visualizations:
      completed_encounters.count_completed_encounters:
        is_active: true
    value_labels: legend
    label_type: labPer
    series_colors: {}
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Referral Programs in 2021 to-date
    hidden_fields:
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
    row: 0
    col: 0
    width: 8
    height: 7
  - title: 2021 Active Referral Programs
    name: 2021 Active Referral Programs
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_grid
    fields: [completed_encounters.count_completed_encounters, completed_encounters.referral_program]
    filters:
      completed_encounters.date_of_service_year: '2021'
    sorts: [completed_encounters.count_completed_encounters desc]
    limit: 100
    column_limit: 100
    total: true
    dynamic_fields: [{table_calculation: referral_program_with_other, label: Referral
          Program with Other, expression: "if(\n# For rows other than the last row\n\
          \ row() != max(row()) \n# Display event name\n ,${completed_encounters.referral_program}\n\
          # For the last row, display \"Other\"\n , \"Other\"\n)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string, is_disabled: true}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: 4dadd4d2-40af-451b-bcdd-1dfaedf76163
      options:
        steps: 5
    show_sql_query_menu_options: false
    pinned_columns:
      "$$$_row_numbers_$$$": left
      completed_encounters.referral_partner: left
    column_order: ["$$$_row_numbers_$$$", completed_encounters.referral_program, completed_encounters.count_completed_encounters]
    show_totals: true
    show_row_totals: true
    series_column_widths:
      completed_encounters.count_completed_encounters: 253
      completed_encounters.referral_partner: 196
      completed_encounters.referral_program: 258
    series_cell_visualizations:
      completed_encounters.count_completed_encounters:
        is_active: true
    value_labels: legend
    label_type: labPer
    series_colors: {}
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Referral Programs in 2021 to-date
    hidden_fields:
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
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
    row: 0
    col: 8
    width: 8
    height: 7
  - title: 2021 Inactive Referral Partners
    name: 2021 Inactive Referral Partners
    model: biz_ops_prod
    explore: completed_encounters
    type: looker_grid
    fields: [completed_encounters.referral_program]
    filters:
      completed_encounters.date_of_service_year: before 2021/01/01
      completed_encounters.count_completed_encounters: 'NULL'
    sorts: [completed_encounters.referral_program]
    limit: 100
    column_limit: 100
    total: true
    dynamic_fields: [{table_calculation: referral_program_with_other, label: Referral
          Program with Other, expression: "if(\n# For rows other than the last row\n\
          \ row() != max(row()) \n# Display event name\n ,${completed_encounters.referral_program}\n\
          # For the last row, display \"Other\"\n , \"Other\"\n)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string, is_disabled: true}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: 4dadd4d2-40af-451b-bcdd-1dfaedf76163
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", completed_encounters.referral_partner, completed_encounters.count_completed_encounters]
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      completed_encounters.count_completed_encounters:
        is_active: true
    value_labels: legend
    label_type: labPer
    series_colors: {}
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Top 10 Referral Programs in 2021 to-date
    hidden_fields:
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
    series_column_widths:
      completed_encounters.count_completed_encounters: 253
      completed_encounters.referral_partner: 196
    pinned_columns:
      "$$$_row_numbers_$$$": left
      completed_encounters.referral_partner: left
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
    row: 0
    col: 16
    width: 8
    height: 7
  - title: Completed Encounters
    name: Completed Encounters
    model: customer_success_prod
    explore: completed_encounters
    type: looker_grid
    fields: [completed_encounters.date_of_service_month, completed_encounters.referral_partner,
      completed_encounters.count_completed_encounters]
    pivots: [completed_encounters.date_of_service_month]
    fill_fields: [completed_encounters.date_of_service_month]
    filters:
      completed_encounters.date_of_service_month: 3 months
      completed_encounters.encounter_type: "-scp,-cc-intake"
    sorts: [completed_encounters.count_completed_encounters desc 0, completed_encounters.date_of_service_month]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: mom_change, _type_hint: number,
        category: table_calculation, expression: "(${completed_encounters.count_completed_encounters}\
          \ / pivot_offset(${completed_encounters.count_completed_encounters}, -1))\
          \ - 1", label: MoM % change, value_format: !!null '', value_format_name: percent_0}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 308bf964-c6f8-f925-70e0-8f0d5e043fd0, label: Custom, type: continuous,
            stops: [{color: "#e60909", offset: 0}, {color: "#FFFFFF", offset: 50},
              {color: "#1be03b", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [mom_change]}]
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: Monthly Change
    listen:
      Referral Channel: completed_encounters.referral_channel
      Referral Partner: completed_encounters.referral_partner
      Referral Program: completed_encounters.referral_program
    row: 7
    col: 0
    width: 24
    height: 6
  - title: Referrals MoM
    name: Referrals MoM
    model: customer_success_prod
    explore: referral_status
    type: looker_grid
    fields: [referral_status.original_referral_date_month, referral_status.referral_partner,
      referral_status.count]
    pivots: [referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 3 months
    sorts: [referral_status.count desc 0, referral_status.original_referral_date_month]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: mom_change, _type_hint: number,
        category: table_calculation, expression: "(${referral_status.count} / pivot_offset(${referral_status.count},\
          \ -1)) - 1", label: MoM % Change, value_format: !!null '', value_format_name: percent_0}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: 551cfaa4-6f48-bbae-342f-261c41e19635, label: Custom, type: continuous,
            stops: [{color: "#e60909", offset: 0}, {color: "#ffffff", offset: 50},
              {color: "#1be03b", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [mom_change]}]
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
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 13
    col: 0
    width: 24
    height: 6
  - title: Average Time From Referral to Booked Encounter
    name: Average Time From Referral to Booked Encounter
    model: customer_success_prod
    explore: referral_status
    type: looker_grid
    fields: [referral_status.original_referral_date_month, referral_status.provider_indicated_specialty,
      referral_status.average_referral_to_scheduling_time_in_days]
    pivots: [referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 3 months
      referral_status.provider_indicated_specialty: "-NULL"
    sorts: [referral_status.average_referral_to_scheduling_time_in_days desc 0, referral_status.original_referral_date_month]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    series_column_widths:
      referral_status.provider_indicated_specialty: 278
    note_state: collapsed
    note_display: above
    note_text: By Specialty
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 19
    col: 0
    width: 24
    height: 6
  - title: Visit Status
    name: Visit Status
    model: customer_success_prod
    explore: referral_status
    type: looker_grid
    fields: [referral_status.referral_partner, referral_status.count_encounters, referral_status.visit_status_grouped]
    pivots: [referral_status.visit_status_grouped]
    filters:
      completed_encounters.referral_program: ''
      referral_status.count_encounters: ">0,NOT NULL"
      referral_status.original_referral_date_year: '2021'
    sorts: [referral_status.referral_partner 0, referral_status.visit_status_grouped]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      referral_status.original_referral_date_month: Referral Month
    series_column_widths:
      referral_status.referral_partner: 198
    series_cell_visualizations:
      referral_status.count_encounters:
        is_active: true
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
    stacking: normal
    legend_position: center
    series_types: {}
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
    note_state: collapsed
    note_display: above
    note_text: "(Referred in 2021)"
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 45
    col: 0
    width: 24
    height: 6
  - title: Number Of Outreach Attempts
    name: Number Of Outreach Attempts
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
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
    series_colors:
      '1': "#C0D918"
      '2': "#85C0DE"
      '4': "#74A09F"
      '5': "#ADAA8D"
      '6': "#49CEC0"
      '7': "#CE642D"
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
    note_state: collapsed
    note_display: above
    note_text: Before Initial Encounter Booked
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 31
    col: 12
    width: 12
    height: 7
  - title: Patient Outreach
    name: Patient Outreach
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [patient_communication_details.communication_type_display_name, patient_communication_details.count,
      patient_communication_details.communication_medium_display_name, communication_type_new_display_name]
    pivots: [patient_communication_details.communication_medium_display_name]
    filters:
      patient_communication_details.communication_type_display_name: "-NULL"
      patient_communication_details.communication_medium_display_name: "-event"
    sorts: [patient_communication_details.communication_medium_display_name, patient_communication_details.count
        desc 0]
    limit: 500
    dynamic_fields: [{dimension: communication_type_new_display_name, _kind_hint: dimension,
        _type_hint: string, category: dimension, expression: 'if(${patient_communication_details.communication_type_display_name}="Referral
          Outreach","Initial Outreach",${patient_communication_details.communication_type_display_name})',
        label: Communication Type new display name, value_format: !!null '', value_format_name: !!null ''}]
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
    y_axes: [{label: "# of Outreach Attempts", orientation: left, series: [{axisId: email
              - patient_communication_details.count, id: email - patient_communication_details.count,
            name: Email}, {axisId: telephone - patient_communication_details.count,
            id: telephone - patient_communication_details.count, name: Telephone}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Outreach Modality
    hidden_series: []
    font_size: '12'
    series_types: {}
    series_colors: {}
    series_labels:
      email - patient_communication_details.count: Email
      telephone - patient_communication_details.count: Telephone
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [patient_communication_details.communication_type_display_name]
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
    note_state: collapsed
    note_display: above
    note_text: By Modality & Outreach Type
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 38
    col: 0
    width: 12
    height: 7
  - title: "% of Declined Outreach (All Time)"
    name: "% of Declined Outreach (All Time)"
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
      collection_id: da8306b5-3b46-48aa-9ead-a3b32292f35c
      palette_id: 95584bf9-c29e-41ea-b6e7-79e9c126e177
      options:
        steps: 5
    series_colors:
      'No': "#D13452"
      'Yes': "#4A80BC"
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
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 38
    col: 12
    width: 12
    height: 7
  - title: Average Time From Book to Completed Encounter
    name: Average Time From Book to Completed Encounter
    model: customer_success_prod
    explore: referral_status
    type: looker_grid
    fields: [referral_status.original_referral_date_month, referral_status.provider_indicated_specialty,
      referral_status.average_visit_created_to_completion_time_in_days]
    pivots: [referral_status.original_referral_date_month]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 3 months
      referral_status.provider_indicated_specialty: "-NULL"
    sorts: [referral_status.original_referral_date_month, referral_status.average_visit_created_to_completion_time_in_days
        desc 0]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      referral_status.provider_indicated_specialty: 278
    series_cell_visualizations:
      referral_status.average_referral_to_scheduling_time_in_days:
        is_active: true
      referral_status.average_visit_created_to_completion_time_in_days:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
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
    note_state: collapsed
    note_display: above
    note_text: By Specialty
    listen:
      Referral Channel: referral_status.referral_channel
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
    row: 25
    col: 0
    width: 24
    height: 6
  - title: Partner Outreach Enabled
    name: Partner Outreach Enabled
    model: customer_success_prod
    explore: partners
    type: looker_grid
    fields: [partners.display_name]
    filters:
      partners.referral_outreach_automation_enabled: 'true'
    sorts: [partners.display_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    row: 31
    col: 0
    width: 6
    height: 7
  - title: Partner Outreach Not Enabled
    name: Partner Outreach Not Enabled
    model: customer_success_prod
    explore: partners
    type: looker_grid
    fields: [partners.display_name]
    filters:
      partners.referral_outreach_automation_enabled: 'false'
    sorts: [partners.display_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    row: 31
    col: 6
    width: 6
    height: 7
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
    model: customer_success_prod
    explore: referral_status
    listens_to_filters: [Referral Program, Referral Partner]
    field: referral_status.referral_channel
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
    listens_to_filters: [Referral Channel, Referral Partner]
    field: referral_status.referral_program
