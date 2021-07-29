- dashboard: clinical_operations_report_gc_metrics_qa
  title: Clinical_Operations_Report (GC Metrics) (QA)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: VISIT CAP METRICS -- Average business days from Date of Visit to completed
      Visit CAP
    type: text
    title_text: VISIT CAP METRICS -- Average business days from Date of Visit to completed
      Visit CAP
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 23
    height: 2
  - title: AVG Time to Complete Visit CAP
    name: AVG Time to Complete Visit CAP
    model: clinical_qa
    explore: clinical_operations
    type: looker_line
    fields: [clinical_operations.average_visit_completion_time_in_days, clinical_operations.initial_cap_completed_date_week]
    filters:
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam"
      clinical_operations.average_visit_completion_time_in_days: ">0"
      clinical_operations.encounter_type: visit
      clinical_operations.referral_program: "-TEST T"
    sorts: [clinical_operations.initial_cap_completed_date_week desc]
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: clinical_operations.average_visit_completion_time_in_days,
            id: clinical_operations.average_visit_completion_time_in_days, name: Average
              visit CAP completion time from date of visit}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 100, type: linear}]
    series_types: {}
    series_colors: {}
    series_labels:
      Yes - clinical_operations.average_visit_completion_time_in_days: High Priority
        Patients
      No - clinical_operations.average_visit_completion_time_in_days: Not High Priority
        Patients
    label_color: [black]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.initial_cap_completed_date_date
    row: 5
    col: 0
    width: 11
    height: 6
  - title: AVG Time for Provider to Complete Visit CAP
    name: AVG Time for Provider to Complete Visit CAP
    model: clinical_qa
    explore: clinical_operations
    type: looker_grid
    fields: [clinical_operations.average_visit_completion_time_in_days, clinical_operations.visit_provider]
    filters:
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam,-NULL"
      clinical_operations.average_visit_completion_time_in_days: ">0"
      clinical_operations.encounter_type: visit
      clinical_operations.referral_partner: "-TESTING FOR UAT"
    sorts: [clinical_operations.average_visit_completion_time_in_days desc]
    limit: 500
    dynamic_fields: [{dimension: patient_priority, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(${clinical_operations.is_high_priority_patient}
          = yes ,"High Priority Patients", "All Patients")', label: Patient Priority,
        value_format: !!null '', value_format_name: !!null ''}]
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
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    series_labels:
      Yes - clinical_operations.average_visit_completion_time_in_days: High Priority
        Patients
      No - clinical_operations.average_visit_completion_time_in_days: All Patients
      clinical_operations.average_visit_completion_time_in_days: Days from Visit to
        Visit CAP completion
    series_column_widths:
      clinical_operations.visit_provider: 244
    series_cell_visualizations:
      clinical_operations.average_visit_completion_time_in_days:
        is_active: true
        value_display: true
    x_axis_gridlines: true
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
    legend_position: right
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: true
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    note_state: expanded
    note_display: above
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.initial_cap_completed_date_date
    row: 2
    col: 11
    width: 12
    height: 9
  - name: RESULTS CAP METRICS -- Average business days from date report received to
      completed Results CAP
    type: text
    title_text: RESULTS CAP METRICS -- Average business days from date report received
      to completed Results CAP
    subtitle_text: ''
    body_text: ''
    row: 11
    col: 0
    width: 23
    height: 2
  - title: AVG Time to Complete Results CAP
    name: AVG Time to Complete Results CAP
    model: clinical_qa
    explore: clinical_operations
    type: looker_line
    fields: [clinical_operations.average_result_cap_completed_time_in_days, clinical_operations.followup_cap_completed_date_week]
    filters:
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam"
      clinical_operations.average_result_cap_completed_time_in_days: ">0,NOT NULL"
      clinical_operations.encounter_type: visit,cc-intake,group-session,"lab_test_authorization"
    sorts: [clinical_operations.followup_cap_completed_date_week desc]
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: clinical_operations.average_visit_completion_time_in_days,
            id: clinical_operations.average_visit_completion_time_in_days, name: Average
              visit CAP completion time from date of visit}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 100, type: linear}]
    series_types: {}
    series_colors: {}
    series_labels:
      Yes - clinical_operations.average_visit_completion_time_in_days: High Priority
        Patients
      No - clinical_operations.average_visit_completion_time_in_days: All Patients
      Yes - clinical_operations.average_result_cap_completed_time_in_days: High Priority
        Patient
      No - clinical_operations.average_result_cap_completed_time_in_days: All Patients
    label_color: [black]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.cap_sent_to_patient_date
    row: 16
    col: 0
    width: 11
    height: 6
  - title: AVG Time for provider to complete Results CAP
    name: AVG Time for provider to complete Results CAP
    model: clinical_qa
    explore: clinical_operations
    type: looker_grid
    fields: [clinical_operations.visit_provider, clinical_operations.average_result_cap_completed_time_in_days]
    filters:
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam,-NULL"
      clinical_operations.average_result_cap_completed_time_in_days: ">0,NOT NULL"
      clinical_operations.encounter_type: visit,cc-intake,group-session,"lab_test_authorization"
    sorts: [clinical_operations.average_result_cap_completed_time_in_days desc]
    limit: 500
    dynamic_fields: [{dimension: patient_priority, _kind_hint: measure, _type_hint: string,
        category: dimension, expression: 'if(${clinical_operations.is_high_priority_patient}
          = yes ,"High Priority Patients", "All Patients")', label: Patient Priority,
        value_format: !!null '', value_format_name: !!null ''}]
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
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    series_labels:
      Yes - clinical_operations.average_visit_completion_time_in_days: High Priority
        Patients
      No - clinical_operations.average_visit_completion_time_in_days: All Patients
      Yes - clinical_operations.average_result_cap_completed_time_in_days: High Priority
        Patients
      No - clinical_operations.average_result_cap_completed_time_in_days: All Patients
      clinical_operations.average_result_cap_completed_time_in_days: Days from Report
        Received to Results CAP completion
    series_cell_visualizations:
      clinical_operations.average_result_cap_completed_time_in_days:
        is_active: true
    x_axis_gridlines: true
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
    legend_position: right
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: true
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.cap_sent_to_patient_date
    row: 13
    col: 11
    width: 12
    height: 9
  - name: ORDER REQUEST METRICS -- Average business days from date of visit to Order
      Request updated
    type: text
    title_text: ORDER REQUEST METRICS -- Average business days from date of visit
      to Order Request updated
    subtitle_text: ''
    body_text: ''
    row: 22
    col: 0
    width: 23
    height: 2
  - title: AVG Time for Order Request to update
    name: AVG Time for Order Request to update
    model: clinical_qa
    explore: clinical_operations
    type: looker_line
    fields: [clinical_operations.average_order_request_update_time_in_days, clinical_operations.date_test_recommended_week]
    filters:
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam"
      clinical_operations.encounter_type: visit,cc-intake,group-session
      clinical_operations.average_order_request_update_time_in_days: ">0,NOT NULL"
    sorts: [clinical_operations.date_test_recommended_week desc]
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
    color_application:
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: clinical_operations.average_visit_completion_time_in_days,
            id: clinical_operations.average_visit_completion_time_in_days, name: Average
              visit CAP completion time from date of visit}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 100, type: linear}]
    series_types: {}
    series_colors: {}
    series_labels:
      Yes - clinical_operations.average_visit_completion_time_in_days: High Priority
        Patients
      No - clinical_operations.average_visit_completion_time_in_days: All Patients
      Yes - clinical_operations.average_result_cap_completed_time_in_days: High Priority
        Patient
      No - clinical_operations.average_result_cap_completed_time_in_days: All Patients
      Yes - clinical_operations.average_order_request_update_time_in_days: High Priority
        Patients
      No - clinical_operations.average_order_request_update_time_in_days: All Patients
    label_color: [black]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.date_test_recommended_date
    row: 27
    col: 0
    width: 11
    height: 6
  - title: AVG Time for Order Request to update, by Provider
    name: AVG Time for Order Request to update, by Provider
    model: clinical_qa
    explore: clinical_operations
    type: looker_grid
    fields: [clinical_operations.visit_provider, clinical_operations.average_order_request_update_time_in_days]
    filters:
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam,-NULL"
      clinical_operations.encounter_type: visit,cc-intake,group-session,"lab_test_authorization"
      clinical_operations.average_order_request_update_time_in_days: ">0,NOT NULL"
    sorts: [clinical_operations.average_order_request_update_time_in_days desc]
    limit: 500
    dynamic_fields: [{dimension: patient_priority, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(${clinical_operations.is_high_priority_patient}
          = yes ,"High Priority Patients", "Not High Priority Patients")', label: Patient
          Priority, value_format: !!null '', value_format_name: !!null ''}]
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
      collection_id: 80e60a97-c02b-4a41-aa05-83522ee2144b
      palette_id: 8b146fdb-43c2-42c2-a572-277b13e9ae5c
      options:
        steps: 5
    show_sql_query_menu_options: false
    column_order: []
    show_totals: true
    show_row_totals: true
    series_labels:
      Yes - clinical_operations.average_visit_completion_time_in_days: High Priority
        Patients
      No - clinical_operations.average_visit_completion_time_in_days: All Patients
      Yes - clinical_operations.average_result_cap_completed_time_in_days: High Priority
        Patients
      No - clinical_operations.average_result_cap_completed_time_in_days: All Patients
      clinical_operations.average_order_request_update_time_in_days: Days from Visit
        to Order Request
    series_cell_visualizations:
      clinical_operations.average_result_cap_completed_time_in_days:
        is_active: true
      clinical_operations.average_order_request_update_time_in_days:
        is_active: true
    x_axis_gridlines: true
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
    legend_position: right
    series_types: {}
    point_style: circle
    series_colors: {}
    show_value_labels: true
    label_density: 25
    label_color: [black]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.date_test_recommended_date
    row: 24
    col: 11
    width: 12
    height: 9
  - title: AVG Time for Order Request to update
    name: AVG Time for Order Request to update (2)
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.average_result_cap_completed_time_in_days]
    filters:
      clinical_operations.encounter_type: visit,cc-intake,group-session
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam"
      clinical_operations.average_result_cap_completed_time_in_days: ">0,NOT NULL"
    limit: 500
    dynamic_fields: [{dimension: relabel, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(${clinical_operations.is_high_priority_patient}
          = yes ,"High Priority Patients", "All Patients")', label: Relabel, value_format: !!null '',
        value_format_name: !!null ''}]
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
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      clinical_operations.average_order_request_update_time_in_days:
        is_active: true
      clinical_operations.average_visit_completion_time_in_days:
        is_active: true
      clinical_operations.average_result_cap_completed_time_in_days:
        is_active: true
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: above
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.date_test_recommended_date
    row: 24
    col: 0
    width: 11
    height: 3
  - title: 'AVG Time for Provider to Complete Results CAP '
    name: 'AVG Time for Provider to Complete Results CAP '
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.average_result_cap_completed_time_in_days]
    filters:
      clinical_operations.encounter_type: visit,cc-intake,group-session,"lab_test_authorization"
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam"
      clinical_operations.average_result_cap_completed_time_in_days: ">0,NOT NULL"
    sorts: [clinical_operations.average_result_cap_completed_time_in_days desc]
    limit: 500
    dynamic_fields: [{dimension: relabel, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(${clinical_operations.is_high_priority_patient}
          = yes ,"High Priority Patients", "All Patients")', label: Relabel, value_format: !!null '',
        value_format_name: !!null ''}]
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
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      clinical_operations.average_order_request_update_time_in_days:
        is_active: true
      clinical_operations.average_visit_completion_time_in_days:
        is_active: true
      clinical_operations.average_result_cap_completed_time_in_days:
        is_active: true
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: above
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.cap_sent_to_patient_date
    row: 13
    col: 0
    width: 11
    height: 3
  - title: AVG Time for Provider to Complete Visit CAP
    name: AVG Time for Provider to Complete Visit CAP (2)
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.average_result_cap_completed_time_in_days]
    filters:
      clinical_operations.encounter_type: visit
      clinical_operations.visit_provider: "-Gayathri@Genomemedical.Com Santhanam"
      clinical_operations.average_result_cap_completed_time_in_days: ">0,NOT NULL"
      clinical_operations.referral_program: "-TEST T"
    sorts: [clinical_operations.average_result_cap_completed_time_in_days desc]
    limit: 500
    dynamic_fields: [{dimension: relabel, _kind_hint: dimension, _type_hint: string,
        category: dimension, expression: 'if(${clinical_operations.is_high_priority_patient}
          = yes ,"High Priority Patients", "Not High Priority Patients")', label: Relabel,
        value_format: !!null '', value_format_name: !!null ''}]
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
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      clinical_operations.average_order_request_update_time_in_days:
        is_active: true
      clinical_operations.average_visit_completion_time_in_days:
        is_active: true
      clinical_operations.average_result_cap_completed_time_in_days:
        is_active: true
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    note_state: collapsed
    note_display: above
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Report Date Range: clinical_operations.initial_cap_completed_date_date
    row: 2
    col: 0
    width: 11
    height: 3
  filters:
  - name: Report Date Range
    title: Report Date Range
    type: field_filter
    default_value: this month
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: clinical_qa
    explore: clinical_operations
    listens_to_filters: []
    field: clinical_operations.initial_cap_completed_date_date
  - name: Is High Priority Patient (Yes / No)
    title: Is High Priority Patient (Yes / No)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: inline
      options: []
    model: clinical_qa
    explore: clinical_operations
    listens_to_filters: []
    field: clinical_operations.is_high_priority_patient
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
    model: clinical_qa
    explore: clinical_operations
    listens_to_filters: []
    field: partner_organizations.name
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
    model: clinical_qa
    explore: clinical_operations
    listens_to_filters: []
    field: partners.display_name
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
    model: clinical_qa
    explore: clinical_operations
    listens_to_filters: []
    field: referral_channels.name
