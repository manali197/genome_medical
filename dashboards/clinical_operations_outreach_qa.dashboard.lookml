- dashboard: clinical_operations_report_outreach_metrics_qa
  title: Clinical Operations Report (Outreach Metrics) (QA)
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Time between patient outreaches (breakdown)
    name: Time between patient outreaches (breakdown)
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_grid
    fields: [clinical_operations_outreach.average_outreach_1_2_time_in_days, clinical_operations_outreach.average_outreach_2_3_time_in_days,
      clinical_operations_outreach.average_outreach_3_4_time_in_days, clinical_operations_outreach.average_outreach_4_5_time_in_days,
      clinical_operations_outreach.average_outreach_5_6_time_in_days, patient_encounter_summary.referral_program]
    filters:
      clinical_operations_outreach.average_outreach_5_6_time_in_days: ''
      clinical_operations_outreach.average_outreach_4_5_time_in_days: ''
      clinical_operations_outreach.average_outreach_2_3_time_in_days: ''
      clinical_operations_outreach.average_outreach_3_4_time_in_days: ''
    sorts: [clinical_operations_outreach.average_outreach_1_2_time_in_days desc]
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
      clinical_operations_outreach.average_outreach_1_2_time_in_days: Between 1st
        and 2nd Outreach
      clinical_operations_outreach.average_outreach_2_3_time_in_days: Between 2nd
        and 3rd Outreach
      clinical_operations_outreach.average_outreach_3_4_time_in_days: Between 3rd
        and 4th Outreach
      clinical_operations_outreach.average_outreach_4_5_time_in_days: Between 4th
        and 5th Outreach
      clinical_operations_outreach.average_outreach_5_6_time_in_days: Between 5th
        and 6th Outreach
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
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
    stacking: ''
    legend_position: left
    series_types: {}
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.next_outreach_date_date
    row: 9
    col: 0
    width: 23
    height: 7
  - title: Time between patient outreaches via phone
    name: Time between patient outreaches via phone
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_column
    fields: [clinical_operations_outreach.average_phone_outreach_1_2_time_in_days,
      clinical_operations_outreach.average_phone_outreach_2_3_time_in_days]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            name: Average time (in days) between patient creation and first phone
              outreach}, {axisId: clinical_operations_outreach.average_phone_outreach_1_2_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_1_2_time_in_days,
            name: Average time (in days) between first and second phone outreach},
          {axisId: clinical_operations_outreach.average_phone_outreach_2_3_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_2_3_time_in_days,
            name: Average time (in days) between second and third phone outreach}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.next_outreach_medium_date_date
    row: 18
    col: 0
    width: 9
    height: 7
  - name: Phone Outreaches
    type: text
    title_text: Phone Outreaches
    subtitle_text: ''
    body_text: ''
    row: 16
    col: 0
    width: 23
    height: 2
  - name: All Outreaches
    type: text
    title_text: All Outreaches
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 0
    width: 23
    height: 2
  - title: Time between patient outreaches via phone (breakdown)
    name: Time between patient outreaches via phone (breakdown)
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_grid
    fields: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
      clinical_operations_outreach.average_phone_outreach_1_2_time_in_days, clinical_operations_outreach.average_phone_outreach_2_3_time_in_days,
      patient_encounter_summary.referral_program]
    sorts: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days desc]
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
      clinical_operations_outreach.average_phone_outreach_0_1_time_in_days: Between
        Patient Creation and 1st Phone Outreach
      clinical_operations_outreach.average_phone_outreach_1_2_time_in_days: Between
        1st and 2nd Phone Outreach
      clinical_operations_outreach.average_phone_outreach_2_3_time_in_days: Between
        2nd and 3rd Phone Outreach
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_0_1_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_2_3_time_in_days:
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
    stacking: ''
    legend_position: left
    series_types: {}
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.next_outreach_medium_date_date
    row: 25
    col: 0
    width: 23
    height: 7
  - title: Time between patient creation and outreaches via phone
    name: Time between patient creation and outreaches via phone
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_column
    fields: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
      clinical_operations_outreach.average_phone_outreach_0_2_time_in_days, clinical_operations_outreach.average_phone_outreach_0_3_time_in_days]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
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
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            name: Average time (in days) between patient creation and first phone
              outreach}, {axisId: clinical_operations_outreach.average_phone_outreach_0_2_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_2_time_in_days,
            name: Average time (in days) between patient creation and second phone
              outreach}, {axisId: clinical_operations_outreach.average_phone_outreach_0_3_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_3_time_in_days,
            name: Average time (in days) between patient creation and third phone
              outreach}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.outreach_date_date
    row: 32
    col: 0
    width: 9
    height: 7
  - title: Time between patient creation and outreaches via phone (breakdown)
    name: Time between patient creation and outreaches via phone (breakdown)
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_grid
    fields: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
      clinical_operations_outreach.average_phone_outreach_0_2_time_in_days, clinical_operations_outreach.average_phone_outreach_0_3_time_in_days,
      patient_encounter_summary.referral_program]
    sorts: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days desc]
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
      clinical_operations_outreach.average_phone_outreach_0_1_time_in_days: Between
        Patient Creation and 1st Phone Outreach
      clinical_operations_outreach.average_phone_outreach_0_2_time_in_days: Between
        Patient Creation and 2nd Phone Outreach
      clinical_operations_outreach.average_phone_outreach_0_3_time_in_days: Between
        Patient Creation and 3rd Phone Outreach
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_0_1_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_0_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_phone_outreach_0_3_time_in_days:
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
    stacking: ''
    legend_position: left
    series_types: {}
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.outreach_date_date
    row: 39
    col: 0
    width: 23
    height: 7
  - title: Time between patient outreaches
    name: Time between patient outreaches
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_column
    fields: [clinical_operations_outreach.average_outreach_1_2_time_in_days, clinical_operations_outreach.average_outreach_2_3_time_in_days,
      clinical_operations_outreach.average_outreach_3_4_time_in_days, clinical_operations_outreach.average_outreach_4_5_time_in_days,
      clinical_operations_outreach.average_outreach_5_6_time_in_days]
    sorts: [clinical_operations_outreach.average_outreach_1_2_time_in_days desc]
    limit: 500
    x_axis_gridlines: true
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
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: clinical_operations_outreach.average_outreach_1_2_time_in_days,
            id: clinical_operations_outreach.average_outreach_1_2_time_in_days, name: Average
              time (in days) between first and second outreach}, {axisId: clinical_operations_outreach.average_outreach_2_3_time_in_days,
            id: clinical_operations_outreach.average_outreach_2_3_time_in_days, name: Average
              time (in days) between second and third outreach}, {axisId: clinical_operations_outreach.average_outreach_3_4_time_in_days,
            id: clinical_operations_outreach.average_outreach_3_4_time_in_days, name: Average
              time (in days) between third and fourth outreach}, {axisId: clinical_operations_outreach.average_outreach_4_5_time_in_days,
            id: clinical_operations_outreach.average_outreach_4_5_time_in_days, name: Average
              time (in days) between fourth and fifth outreach}, {axisId: clinical_operations_outreach.average_outreach_5_6_time_in_days,
            id: clinical_operations_outreach.average_outreach_5_6_time_in_days, name: Average
              time (in days) between fifth and sixth outreach}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    show_null_points: true
    interpolation: linear
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
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    groupBars: true
    labelSize: 10pt
    showLegend: true
    map: usa
    map_projection: ''
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.next_outreach_date_date
    row: 2
    col: 0
    width: 9
    height: 7
  - title: Time between patient outreaches (trend)
    name: Time between patient outreaches (trend)
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_area
    fields: [clinical_operations_outreach.average_outreach_1_2_time_in_days, clinical_operations_outreach.average_outreach_2_3_time_in_days,
      clinical_operations_outreach.average_outreach_3_4_time_in_days, clinical_operations_outreach.average_outreach_4_5_time_in_days,
      clinical_operations_outreach.average_outreach_5_6_time_in_days, clinical_operations_outreach.outreach_date_week]
    fill_fields: [clinical_operations_outreach.outreach_date_week]
    sorts: [clinical_operations_outreach.outreach_date_week desc]
    limit: 6
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: clinical_operations_outreach.average_outreach_1_2_time_in_days,
            id: clinical_operations_outreach.average_outreach_1_2_time_in_days, name: Average
              time (in days) between first and second outreach}, {axisId: clinical_operations_outreach.average_outreach_2_3_time_in_days,
            id: clinical_operations_outreach.average_outreach_2_3_time_in_days, name: Average
              time (in days) between second and third outreach}, {axisId: clinical_operations_outreach.average_outreach_3_4_time_in_days,
            id: clinical_operations_outreach.average_outreach_3_4_time_in_days, name: Average
              time (in days) between third and fourth outreach}, {axisId: clinical_operations_outreach.average_outreach_4_5_time_in_days,
            id: clinical_operations_outreach.average_outreach_4_5_time_in_days, name: Average
              time (in days) between fourth and fifth outreach}, {axisId: clinical_operations_outreach.average_outreach_5_6_time_in_days,
            id: clinical_operations_outreach.average_outreach_5_6_time_in_days, name: Average
              time (in days) between fifth and sixth outreach}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
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
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    groupBars: true
    labelSize: 10pt
    showLegend: true
    map: usa
    map_projection: ''
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.next_outreach_date_date
    row: 2
    col: 9
    width: 14
    height: 7
  - title: Time between patient outreaches via phone (trend)
    name: Time between patient outreaches via phone (trend)
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_area
    fields: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
      clinical_operations_outreach.average_phone_outreach_1_2_time_in_days, clinical_operations_outreach.average_phone_outreach_2_3_time_in_days,
      clinical_operations_outreach.outreach_date_week]
    fill_fields: [clinical_operations_outreach.outreach_date_week]
    sorts: [clinical_operations_outreach.outreach_date_week desc]
    limit: 6
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            name: Average time (in days) between patient creation and first phone
              outreach}, {axisId: clinical_operations_outreach.average_phone_outreach_1_2_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_1_2_time_in_days,
            name: Average time (in days) between first and second phone outreach},
          {axisId: clinical_operations_outreach.average_phone_outreach_2_3_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_2_3_time_in_days,
            name: Average time (in days) between second and third phone outreach}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.next_outreach_medium_date_date
    row: 18
    col: 9
    width: 14
    height: 7
  - title: Time between patient creation and outreaches via phone (trend)
    name: Time between patient creation and outreaches via phone (trend)
    model: clinical_qa
    explore: clinical_operations_outreach
    type: looker_area
    fields: [clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
      clinical_operations_outreach.average_phone_outreach_0_2_time_in_days, clinical_operations_outreach.average_phone_outreach_0_3_time_in_days,
      clinical_operations_outreach.outreach_date_week]
    fill_fields: [clinical_operations_outreach.outreach_date_week]
    sorts: [clinical_operations_outreach.outreach_date_week desc]
    limit: 6
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Average Days, orientation: left, series: [{axisId: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_1_time_in_days,
            name: Average time (in days) between patient creation and first phone
              outreach}, {axisId: clinical_operations_outreach.average_phone_outreach_0_2_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_2_time_in_days,
            name: Average time (in days) between patient creation and second phone
              outreach}, {axisId: clinical_operations_outreach.average_phone_outreach_0_3_time_in_days,
            id: clinical_operations_outreach.average_phone_outreach_0_3_time_in_days,
            name: Average time (in days) between patient creation and third phone
              outreach}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: false
    size_to_fit: true
    series_cell_visualizations:
      clinical_operations_outreach.average_outreach_1_2_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_2_3_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_3_4_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_4_5_time_in_days:
        is_active: true
      clinical_operations_outreach.average_outreach_5_6_time_in_days:
        is_active: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    listen:
      Referral Program: partners.display_name
      Referral Partner: partner_organizations.name
      Referral Channel: referral_channels.name
      Referral Outreach Automation Enabled: partners.referral_outreach_automation_enabled
      Report Date Range: clinical_operations_outreach.outreach_date_date
    row: 32
    col: 9
    width: 14
    height: 7
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
    explore: clinical_operations_outreach
    listens_to_filters: []
    field: clinical_operations_outreach.next_outreach_date_date
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
    explore: partners
    listens_to_filters: [Referral Partner, Referral Channel, Referral Outreach Automation
        Enabled]
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
    listens_to_filters: [Referral Program, Referral Channel, Referral Outreach Automation
        Enabled]
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
    listens_to_filters: [Referral Program, Referral Partner, Referral Outreach Automation
        Enabled]
    field: referral_channels.name
  - name: Referral Outreach Automation Enabled
    title: Referral Outreach Automation Enabled
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
      options: []
    model: clinical_qa
    explore: partners
    listens_to_filters: [Referral Program, Referral Partner, Referral Channel]
    field: partners.referral_outreach_automation_enabled
