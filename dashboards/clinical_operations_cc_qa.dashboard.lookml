- dashboard: clinical_operations_report_cc_metrics_qa
  title: Clinical_Operations_Report (CC Metrics) (QA)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Visit CAPs sent by CCs
    name: Total Visit CAPs sent by CCs
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.count_visit_caps]
    sorts: [clinical_operations.count_visit_caps desc]
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
    defaults_version: 1
    series_types: {}
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
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Report Date Range: clinical_operations.initial_visit_summary_sent_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 2
    col: 0
    width: 11
    height: 3
  - title: Total Result CAPs sent by CCs
    name: Total Result CAPs sent by CCs
    model: clinical_qa
    explore: clinical_operations
    type: looker_grid
    fields: [clinical_operations.visit_cap_cc_user_name, clinical_operations.count_result_caps]
    sorts: [clinical_operations.count_result_caps desc]
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
    series_labels:
      clinical_operations.visit_cap_cc_user_name: Name
    series_cell_visualizations:
      clinical_operations.count_result_caps:
        is_active: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Report Date Range: clinical_operations.followup_cap_completed_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 17
    col: 0
    width: 11
    height: 6
  - title: Total Result CAPs sent by CCs
    name: Total Result CAPs sent by CCs (2)
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.count_result_caps]
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
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Report Date Range: clinical_operations.followup_cap_completed_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 14
    col: 0
    width: 11
    height: 3
  - title: Total Visit CAPs sent by CCs
    name: Total Visit CAPs sent by CCs (2)
    model: clinical_qa
    explore: clinical_operations
    type: looker_grid
    fields: [clinical_operations.count_visit_caps, clinical_operations.visit_cap_cc_user_name]
    sorts: [clinical_operations.count_visit_caps desc]
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
      clinical_operations.visit_cap_cc_user_name: Name
    series_cell_visualizations:
      clinical_operations.count_visit_caps:
        is_active: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    series_types: {}
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Report Date Range: clinical_operations.initial_visit_summary_sent_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 5
    col: 0
    width: 11
    height: 7
  - name: Visit CAP Metrics
    type: text
    title_text: Visit CAP Metrics
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 22
    height: 2
  - title: AVG time to release Visit CAP (from CAP completion time)
    name: AVG time to release Visit CAP (from CAP completion time)
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.average_visit_cap_release_time_in_days]
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
    series_labels:
      Yes - clinical_operations.average_visit_cap_release_time_in_days: High Priority
        Patient
      No - clinical_operations.average_visit_cap_release_time_in_days: All Patients
      clinical_operations.average_visit_cap_release_time_in_days: AVG time to release
        Visit CAP
      relabel: Priority Level
    series_column_widths:
      relabel: 190
    series_cell_visualizations:
      clinical_operations.average_visit_cap_release_time_in_days:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: Average Business Days, orientation: left, series: [{axisId: clinical_operations.average_visit_cap_release_time_in_days,
            id: No - clinical_operations.average_visit_cap_release_time_in_days, name: All
              Patients}, {axisId: clinical_operations.average_visit_cap_release_time_in_days,
            id: Yes - clinical_operations.average_visit_cap_release_time_in_days,
            name: High Priority Patient}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    stacking: ''
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
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
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    note_state: expanded
    note_display: above
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Report Date Range: clinical_operations.initial_visit_summary_sent_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 2
    col: 11
    width: 11
    height: 3
  - title: AVG time to release Visit CAP
    name: AVG time to release Visit CAP
    model: clinical_qa
    explore: clinical_operations
    type: looker_line
    fields: [clinical_operations.average_visit_cap_release_time_in_days, clinical_operations.initial_visit_summary_sent_week]
    fill_fields: [clinical_operations.initial_visit_summary_sent_week]
    sorts: [clinical_operations.initial_visit_summary_sent_week desc]
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
    y_axes: [{label: Average Business Days, orientation: left, series: [{axisId: clinical_operations.average_visit_cap_release_time_in_days,
            id: No - clinical_operations.average_visit_cap_release_time_in_days, name: 'No'},
          {axisId: clinical_operations.average_visit_cap_release_time_in_days, id: Yes
              - clinical_operations.average_visit_cap_release_time_in_days, name: 'Yes'}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      Yes - clinical_operations.average_visit_cap_release_time_in_days: High Priority
        Patient
      No - clinical_operations.average_visit_cap_release_time_in_days: All Patients
    label_color: [black]
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
      Report Date Range: clinical_operations.initial_visit_summary_sent_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 5
    col: 11
    width: 11
    height: 7
  - name: Results CAPs Metrics
    type: text
    title_text: Results CAPs Metrics
    subtitle_text: ''
    body_text: ''
    row: 12
    col: 0
    width: 22
    height: 2
  - name: Prior Authorization Form Metrics (NEED TO UPDATE FILTER)
    type: text
    title_text: Prior Authorization Form Metrics (NEED TO UPDATE FILTER)
    subtitle_text: ''
    body_text: ''
    row: 34
    col: 0
    width: 22
    height: 2
  - name: Orders Sent Metrics (NEED TO UPDATE FILTER)
    type: text
    title_text: Orders Sent Metrics (NEED TO UPDATE FILTER)
    subtitle_text: ''
    body_text: ''
    row: 23
    col: 0
    width: 22
    height: 2
  - title: AVG time to release Results CAP
    name: AVG time to release Results CAP
    model: clinical_qa
    explore: clinical_operations
    type: single_value
    fields: [clinical_operations.average_result_cap_release_time_in_days]
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
    series_labels:
      Yes - clinical_operations.average_visit_cap_release_time_in_days: High Priority
        Patient
      No - clinical_operations.average_visit_cap_release_time_in_days: All Patients
      clinical_operations.average_visit_cap_release_time_in_days: Average time to
        release Visit CAP
      relabel: Priority Level
      clinical_operations.average_result_cap_release_time_in_days: AVG time to release
        Results CAP
    series_column_widths:
      relabel: 190
    series_cell_visualizations:
      clinical_operations.average_visit_cap_release_time_in_days:
        is_active: true
      clinical_operations.average_result_cap_release_time_in_days:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: Average Business Days, orientation: left, series: [{axisId: clinical_operations.average_visit_cap_release_time_in_days,
            id: No - clinical_operations.average_visit_cap_release_time_in_days, name: All
              Patients}, {axisId: clinical_operations.average_visit_cap_release_time_in_days,
            id: Yes - clinical_operations.average_visit_cap_release_time_in_days,
            name: High Priority Patient}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    stacking: ''
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
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
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    note_state: expanded
    note_display: above
    listen:
      Is High Priority Patient (Yes / No): clinical_operations.is_high_priority_patient
      Report Date Range: clinical_operations.followup_cap_completed_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 14
    col: 11
    width: 11
    height: 3
  - title: AVG time to release Results CAP
    name: AVG time to release Results CAP (2)
    model: clinical_qa
    explore: clinical_operations
    type: looker_line
    fields: [clinical_operations.average_result_cap_release_time_in_days, clinical_operations.followup_cap_completed_date_week]
    fill_fields: [clinical_operations.followup_cap_completed_date_week]
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
    y_axes: [{label: Average Business Days, orientation: left, series: [{axisId: clinical_operations.average_visit_cap_release_time_in_days,
            id: No - clinical_operations.average_visit_cap_release_time_in_days, name: 'No'},
          {axisId: clinical_operations.average_visit_cap_release_time_in_days, id: Yes
              - clinical_operations.average_visit_cap_release_time_in_days, name: 'Yes'}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_labels:
      Yes - clinical_operations.average_visit_cap_release_time_in_days: High Priority
        Patient
      No - clinical_operations.average_visit_cap_release_time_in_days: All Patients
      Yes - clinical_operations.average_result_cap_release_time_in_days: High Priority
        Patients
      No - clinical_operations.average_result_cap_release_time_in_days: All Patients
    label_color: [black]
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
      Report Date Range: clinical_operations.followup_cap_completed_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 17
    col: 11
    width: 11
    height: 6
  - title: AVG time to place test order
    name: AVG time to place test order
    model: clinical_qa
    explore: clinical_operations_orders
    type: looker_grid
    fields: [clinical_operations_orders.average_order_placement_time_in_days, clinical_operations_orders.order_sending_agent]
    sorts: [clinical_operations_orders.average_order_placement_time_in_days desc]
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
    series_labels:
      clinical_operations_orders.order_sending_agent: Name
    series_cell_visualizations:
      clinical_operations_orders.average_order_placement_time_in_days:
        is_active: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Report Date Range: clinical_operations_orders.date_test_ordered_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 28
    col: 11
    width: 11
    height: 6
  - title: AVG time to place test order
    name: AVG time to place test order (2)
    model: clinical_qa
    explore: clinical_operations_orders
    type: single_value
    fields: [clinical_operations_orders.average_order_placement_time_in_days]
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
      Report Date Range: clinical_operations_orders.date_test_ordered_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 25
    col: 11
    width: 11
    height: 3
  - title: Total Orders Sent by CCs
    name: Total Orders Sent by CCs
    model: clinical_qa
    explore: clinical_operations_orders
    type: single_value
    fields: [clinical_operations_orders.count_orders]
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
      Report Date Range: clinical_operations_orders.date_test_ordered_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 25
    col: 0
    width: 11
    height: 3
  - title: Total Orders Sent by CCs
    name: Total Orders Sent by CCs (2)
    model: clinical_qa
    explore: clinical_operations_orders
    type: looker_grid
    fields: [clinical_operations_orders.count_orders, clinical_operations_orders.order_sending_agent]
    sorts: [clinical_operations_orders.count_orders desc]
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
    series_labels:
      clinical_operations_orders.order_sending_agent: Name
    series_cell_visualizations:
      clinical_operations_orders.count_orders:
        is_active: true
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    listen:
      Report Date Range: clinical_operations_orders.date_test_ordered_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 28
    col: 0
    width: 11
    height: 6
  - title: Total Prior Authorization Forms sent by CCs
    name: Total Prior Authorization Forms sent by CCs
    model: clinical_qa
    explore: clinical_operations_preauths
    type: single_value
    fields: [clinical_operations_preauths.count]
    sorts: [clinical_operations_preauths.count desc]
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
    defaults_version: 1
    listen:
      Report Date Range: clinical_operations_preauths.dispatch_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 36
    col: 0
    width: 11
    height: 3
  - title: Total Prior Authorization Forms sent by CCs
    name: Total Prior Authorization Forms sent by CCs (2)
    model: clinical_qa
    explore: clinical_operations_preauths
    type: looker_grid
    fields: [clinical_operations_preauths.count, clinical_operations_preauths.pa_sending_cc]
    sorts: [clinical_operations_preauths.count desc]
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
    series_labels:
      clinical_operations_preauths.pa_sending_cc: Name
    series_cell_visualizations:
      clinical_operations_preauths.count:
        is_active: true
    series_types: {}
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Report Date Range: clinical_operations_preauths.dispatch_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 39
    col: 0
    width: 11
    height: 6
  - title: PA Form Submission Time
    name: PA Form Submission Time
    model: clinical_qa
    explore: clinical_operations_preauths
    type: looker_line
    fields: [clinical_operations_preauths.average_pa_form_sent_time_in_days, clinical_operations_preauths.dispatch_date_week]
    fill_fields: [clinical_operations_preauths.dispatch_date_week]
    sorts: [clinical_operations_preauths.dispatch_date_week desc]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
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
      Report Date Range: clinical_operations_preauths.dispatch_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 39
    col: 11
    width: 11
    height: 6
  - title: PA Form Submission Time
    name: PA Form Submission Time (2)
    model: clinical_qa
    explore: clinical_operations_preauths
    type: single_value
    fields: [clinical_operations_preauths.average_pa_form_sent_time_in_days]
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
      Report Date Range: clinical_operations_preauths.dispatch_date_date
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
    row: 36
    col: 11
    width: 11
    height: 3
  filters:
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
    explore: clinical_operations_orders
    listens_to_filters: []
    field: clinical_operations_orders.date_test_ordered_date
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
