- dashboard: cs_referral_status__partner_dashboard_v2_prod
  title: CS Partner Dashboard (Prod) Test Orders
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Testing Recommendations by Referral Month
    name: Testing Recommendations by Referral Month
    model: customer_success_prod
    explore: referral_status
    type: looker_column
    fields: [encounters_count, referral_status.test_recommended, referral_status.original_referral_date_month]
    pivots: [referral_status.test_recommended]
    fill_fields: [referral_status.original_referral_date_month]
    filters:
      referral_status.original_referral_date_month: 6 months
      referral_status.test_recommended: "-PA,-NULL"
      referral_status.visit_status: Completed
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: No - encounters_count,
            id: No - encounters_count, name: Testing Not Recommended}, {axisId: Yes
              - encounters_count, id: Yes - encounters_count, name: Testing Recommended}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: custom,
        tickDensityCustom: 14, type: linear}]
    x_axis_label: Referral Month
    font_size: '10'
    series_types: {}
    series_colors: {}
    series_labels:
      referral_status.test_recommended___null - encounters_count: N/A
      No - encounters_count: Testing Not Recommended
      Yes - encounters_count: Testing Recommended
    defaults_version: 1
    hidden_fields: []
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 0
    col: 0
    width: 12
    height: 7
  - title: Top 10 Tests Ordered
    name: Top 10 Tests Ordered
    model: customer_success_prod
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
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 313d7e4a-1e68-4f9c-9a5d-3135d8ffaa47
      options:
        steps: 5
        reverse: true
    series_colors: {}
    series_types: {}
    defaults_version: 1
    hidden_fields: [top_test.test_rank]
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 14
    col: 12
    width: 12
    height: 9
  - title: Top 10 Labs Utilized
    name: Top 10 Labs Utilized
    model: customer_success_prod
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
      palette_id: 5b289dc9-1446-49e6-ab05-ba239a94b7a9
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    defaults_version: 1
    hidden_fields: [top_labs.lab_rank]
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 14
    col: 0
    width: 12
    height: 9
  - title: Test Order Status by Month
    name: Test Order Status by Month
    model: customer_success_prod
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
    y_axes: [{label: Encounters, orientation: left, series: [{axisId: Cancelled -
              encounters_count, id: Cancelled - encounters_count, name: Cancelled},
          {axisId: Patient Not Responsive - encounters_count, id: Patient Not Responsive
              - encounters_count, name: Patient Not Responsive}, {axisId: Results
              Entered - encounters_count, id: Results Entered - encounters_count,
            name: Results Entered}, {axisId: Sample Not Submitted - encounters_count,
            id: Sample Not Submitted - encounters_count, name: Sample Not Submitted},
          {axisId: Sent to Lab - encounters_count, id: Sent to Lab - encounters_count,
            name: Sent to Lab}, {axisId: Waiting to Submit - encounters_count, id: Waiting
              to Submit - encounters_count, name: Waiting to Submit}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: custom, tickDensityCustom: 14,
        type: linear}]
    x_axis_label: Month Test Ordered
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
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 0
    col: 12
    width: 12
    height: 7
  - title: Test Order Status
    name: Test Order Status
    model: customer_success_prod
    explore: referral_status
    type: looker_bar
    fields: [referral_status.count, referral_status.consultation_type_limited, gene_test_orders.order_status_display_name]
    pivots: [referral_status.consultation_type_limited]
    filters:
      gene_test_orders.order_status_display_name: "-N/A"
    sorts: [referral_status.count desc 0, referral_status.consultation_type_limited]
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
    y_axes: [{label: Referral Count, orientation: bottom, series: [{axisId: Get Started
              - No Results - referral_status.count, id: Get Started - No Results -
              referral_status.count, name: Get Started - w/o Results}, {axisId: Get
              Started - w/Results - referral_status.count, id: Get Started - w/Results
              - referral_status.count, name: Get Started - w/Results}, {axisId: OTHERS
              - referral_status.count, id: OTHERS - referral_status.count, name: Other},
          {axisId: Return of Results - referral_status.count, id: Return of Results
              - referral_status.count, name: Return of Results}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Order Status
    series_types: {}
    series_colors:
      Get Started - w/Results - referral_status.count: "#B1399E"
      OTHERS - referral_status.count: "#4276BE"
      Get Started - No Results - referral_status.count: "#592EC2"
      Return of Results - referral_status.count: "#C2DD67"
    series_labels:
      Get Started - No Results - referral_status.count: Get Started - w/o Results
      OTHERS - referral_status.count: Other
    defaults_version: 1
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 7
    col: 0
    width: 24
    height: 7
  - title: "% of Tests Ordered by Visit Type"
    name: "% of Tests Ordered by Visit Type"
    model: customer_success_prod
    explore: referral_status
    type: looker_donut_multiples
    fields: [referral_status.consultation_type_limited, referral_status.count, referral_status.count_patients_with_order]
    filters:
      referral_status.consultation_type_limited: "-OTHERS"
    sorts: [referral_status.consultation_type_limited]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: count_of_patients_without_order,
        _type_hint: number, category: table_calculation, expression: "${referral_status.count}-${referral_status.count_patients_with_order}",
        label: Count of Patients without Order, value_format: !!null '', value_format_name: decimal_0}]
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: ab3e6420-3e2f-42a2-802b-e4e9036b089f
      options:
        steps: 5
    series_colors:
      referral_status.count_patients_with_order: "#AEC8C1"
    series_labels:
      referral_status.count_patients_with_order: "% Tests Ordered"
      count_of_patients_without_order: "% Tests Not Ordered"
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [referral_status.count]
    defaults_version: 1
    series_types: {}
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 23
    col: 8
    width: 16
    height: 7
  - title: "% of Tests Ordered After Completed Visit"
    name: "% of Tests Ordered After Completed Visit"
    model: customer_success_prod
    explore: referral_status
    type: looker_donut_multiples
    fields: [referral_status.count, referral_status.count_patients_with_order]
    filters:
      referral_status.consultation_type_limited: "-OTHERS"
    sorts: [referral_status.count desc]
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: count_of_patients_without_order,
        _type_hint: number, category: table_calculation, expression: "${referral_status.count}-${referral_status.count_patients_with_order}",
        label: Count of Patients without Order, value_format: !!null '', value_format_name: decimal_0}]
    show_value_labels: true
    font_size: 12
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: ab3e6420-3e2f-42a2-802b-e4e9036b089f
      options:
        steps: 5
    series_colors: {}
    series_labels:
      referral_status.count_patients_with_order: "% Tests Ordered"
      count_of_patients_without_order: "% Tests Not Ordered"
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [referral_status.count]
    defaults_version: 1
    series_types: {}
    listen:
      Referral Partner: referral_status.referral_partner
      Referral Program: referral_status.referral_program
      Referral Channel: referral_status.referral_channel
    row: 23
    col: 0
    width: 8
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
