- dashboard: customer_satisfaction_v2
  title: Customer Satisfaction v2
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: GC CSAT (Question 1)
    name: GC CSAT (Question 1)
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.q180822923, customer_satisfaction.count]
    pivots: [customer_satisfaction.q180822923]
    sorts: [customer_satisfaction.q180822923]
    limit: 500
    dynamic_fields: [{table_calculation: csat_disagree, label: CSAT disagree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_agree, label: CSAT agree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "Strongly AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "AGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_neutral, label: CSAT neutral, expression: 'coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat, label: CSAT, expression: 'round(${csat_agree} * 100
          / (${csat_agree} + ${csat_disagree} + ${csat_neutral}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: customer_satisfaction.count,
            id: customer_satisfaction.count, name: Customer Satisfaction}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Response Value
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [csat_disagree, csat_agree, csat_neutral, customer_satisfaction.count]
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 10
    col: 0
    width: 5
    height: 9
  - name: 'Question 1: "All of my questions were answered by my genetic counselor"'
    type: text
    title_text: 'Question 1: "All of my questions were answered by my genetic counselor"'
    subtitle_text: ''
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: 'Question 1: Response by VSEE Specialties'
    name: 'Question 1: Response by VSEE Specialties'
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_column
    fields: [customer_satisfaction.q180822923, customer_satisfaction.count, customer_satisfaction.vsee_specialty]
    pivots: [customer_satisfaction.vsee_specialty]
    sorts: [customer_satisfaction.q180822923 desc]
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
    legend_position: right
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
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    y_axes: [{label: Response count, orientation: left, series: [{axisId: " - customer_satisfaction.count",
            id: " - customer_satisfaction.count", name: Customer Satisfaction}, {
            axisId: ",Cancer - customer_satisfaction.count", id: ",Cancer - customer_satisfaction.count",
            name: ",Cancer"}, {axisId: ",Healthy Screening - customer_satisfaction.count",
            id: ",Healthy Screening - customer_satisfaction.count", name: ",Healthy\
              \ Screening"}, {axisId: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            id: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            name: ",Healthy Screening,Other Adult Genetics"}, {axisId: ",Neurology\
              \ - customer_satisfaction.count", id: ",Neurology - customer_satisfaction.count",
            name: ",Neurology"}, {axisId: ",Other Adult Genetics - customer_satisfaction.count",
            id: ",Other Adult Genetics - customer_satisfaction.count", name: ",Other\
              \ Adult Genetics"}, {axisId: ",Reproductive - customer_satisfaction.count",
            id: ",Reproductive - customer_satisfaction.count", name: ",Reproductive"},
          {axisId: Cancer - customer_satisfaction.count, id: Cancer - customer_satisfaction.count,
            name: Cancer}, {axisId: 'Cancer,Cardiology - customer_satisfaction.count',
            id: 'Cancer,Cardiology - customer_satisfaction.count', name: 'Cancer,Cardiology'},
          {axisId: 'Cancer,Healthy Screening - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening - customer_satisfaction.count', name: 'Cancer,Healthy Screening'},
          {axisId: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            id: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            name: 'Cancer,Healthy Screening,Neurology'}, {axisId: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', name: 'Cancer,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cancer,Neurology - customer_satisfaction.count',
            id: 'Cancer,Neurology - customer_satisfaction.count', name: 'Cancer,Neurology'},
          {axisId: 'Cancer,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cancer,Other Adult
              Genetics'}, {axisId: 'Cancer,Pediatrics - customer_satisfaction.count',
            id: 'Cancer,Pediatrics - customer_satisfaction.count', name: 'Cancer,Pediatrics'},
          {axisId: 'Cancer,Reproductive - customer_satisfaction.count', id: 'Cancer,Reproductive
              - customer_satisfaction.count', name: 'Cancer,Reproductive'}, {axisId: Cardiology
              - customer_satisfaction.count, id: Cardiology - customer_satisfaction.count,
            name: Cardiology}, {axisId: 'Cardiology,Healthy Screening - customer_satisfaction.count',
            id: 'Cardiology,Healthy Screening - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening'}, {axisId: 'Cardiology,Healthy Screening,Other Adult Genetics
              - customer_satisfaction.count', id: 'Cardiology,Healthy Screening,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cardiology,Neurology - customer_satisfaction.count',
            id: 'Cardiology,Neurology - customer_satisfaction.count', name: 'Cardiology,Neurology'},
          {axisId: 'Cardiology,Other Adult Genetics - customer_satisfaction.count',
            id: 'Cardiology,Other Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Other
              Adult Genetics'}, {axisId: Healthy Screening - customer_satisfaction.count,
            id: Healthy Screening - customer_satisfaction.count, name: Healthy Screening},
          {axisId: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            id: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            name: 'Healthy Screening,Other Adult Genetics'}, {axisId: 'Healthy Screening,Pediatrics
              - customer_satisfaction.count', id: 'Healthy Screening,Pediatrics -
              customer_satisfaction.count', name: 'Healthy Screening,Pediatrics'},
          {axisId: 'Healthy Screening,Prenatal - customer_satisfaction.count', id: 'Healthy
              Screening,Prenatal - customer_satisfaction.count', name: 'Healthy Screening,Prenatal'},
          {axisId: 'Healthy Screening,Reproductive - customer_satisfaction.count',
            id: 'Healthy Screening,Reproductive - customer_satisfaction.count', name: 'Healthy
              Screening,Reproductive'}, {axisId: Neurology - customer_satisfaction.count,
            id: Neurology - customer_satisfaction.count, name: Neurology}, {axisId: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', id: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', name: 'Neurology,Other
              Adult Genetics'}, {axisId: 'Neurology,Pediatrics - customer_satisfaction.count',
            id: 'Neurology,Pediatrics - customer_satisfaction.count', name: 'Neurology,Pediatrics'},
          {axisId: Other Adult Genetics - customer_satisfaction.count, id: Other Adult
              Genetics - customer_satisfaction.count, name: Other Adult Genetics},
          {axisId: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count',
            id: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count', name: 'Other
              Adult Genetics,Pediatrics'}, {axisId: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', id: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', name: 'Other Adult Genetics,Pharmacogenomics'},
          {axisId: 'Other Adult Genetics,Prenatal - customer_satisfaction.count',
            id: 'Other Adult Genetics,Prenatal - customer_satisfaction.count', name: 'Other
              Adult Genetics,Prenatal'}, {axisId: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', id: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', name: 'Other Adult Genetics,Reproductive'},
          {axisId: Pediatrics - customer_satisfaction.count, id: Pediatrics - customer_satisfaction.count,
            name: Pediatrics}, {axisId: Pharmacogenomics - customer_satisfaction.count,
            id: Pharmacogenomics - customer_satisfaction.count, name: Pharmacogenomics},
          {axisId: Prenatal - customer_satisfaction.count, id: Prenatal - customer_satisfaction.count,
            name: Prenatal}, {axisId: 'Prenatal,Reproductive - customer_satisfaction.count',
            id: 'Prenatal,Reproductive - customer_satisfaction.count', name: 'Prenatal,Reproductive'},
          {axisId: Reproductive - customer_satisfaction.count, id: Reproductive -
              customer_satisfaction.count, name: Reproductive}, {axisId: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, id: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, name: "∅"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Response value
    hide_legend: false
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 10
    col: 5
    width: 19
    height: 9
  - name: 'Question 2: "The info I learned from my genetic counseling session was
      valuable to me"'
    type: text
    title_text: 'Question 2: "The info I learned from my genetic counseling session
      was valuable to me."'
    subtitle_text: ''
    body_text: ''
    row: 19
    col: 0
    width: 24
    height: 2
  - title: 'Question 2: Responses by Provider Specialties'
    name: 'Question 2: Responses by Provider Specialties'
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_column
    fields: [customer_satisfaction.count, customer_satisfaction.provider_indicated_specialty,
      customer_satisfaction.q180823390]
    pivots: [customer_satisfaction.provider_indicated_specialty]
    sorts: [customer_satisfaction.provider_indicated_specialty 0, customer_satisfaction.q180823390
        desc]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    y_axes: [{label: Response count, orientation: left, series: [{axisId: " - customer_satisfaction.count",
            id: " - customer_satisfaction.count", name: Customer Satisfaction}, {
            axisId: ",Cancer - customer_satisfaction.count", id: ",Cancer - customer_satisfaction.count",
            name: ",Cancer"}, {axisId: ",Healthy Screening - customer_satisfaction.count",
            id: ",Healthy Screening - customer_satisfaction.count", name: ",Healthy\
              \ Screening"}, {axisId: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            id: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            name: ",Healthy Screening,Other Adult Genetics"}, {axisId: ",Neurology\
              \ - customer_satisfaction.count", id: ",Neurology - customer_satisfaction.count",
            name: ",Neurology"}, {axisId: ",Other Adult Genetics - customer_satisfaction.count",
            id: ",Other Adult Genetics - customer_satisfaction.count", name: ",Other\
              \ Adult Genetics"}, {axisId: ",Reproductive - customer_satisfaction.count",
            id: ",Reproductive - customer_satisfaction.count", name: ",Reproductive"},
          {axisId: Cancer - customer_satisfaction.count, id: Cancer - customer_satisfaction.count,
            name: Cancer}, {axisId: 'Cancer,Cardiology - customer_satisfaction.count',
            id: 'Cancer,Cardiology - customer_satisfaction.count', name: 'Cancer,Cardiology'},
          {axisId: 'Cancer,Healthy Screening - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening - customer_satisfaction.count', name: 'Cancer,Healthy Screening'},
          {axisId: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            id: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            name: 'Cancer,Healthy Screening,Neurology'}, {axisId: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', name: 'Cancer,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cancer,Neurology - customer_satisfaction.count',
            id: 'Cancer,Neurology - customer_satisfaction.count', name: 'Cancer,Neurology'},
          {axisId: 'Cancer,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cancer,Other Adult
              Genetics'}, {axisId: 'Cancer,Pediatrics - customer_satisfaction.count',
            id: 'Cancer,Pediatrics - customer_satisfaction.count', name: 'Cancer,Pediatrics'},
          {axisId: 'Cancer,Reproductive - customer_satisfaction.count', id: 'Cancer,Reproductive
              - customer_satisfaction.count', name: 'Cancer,Reproductive'}, {axisId: Cardiology
              - customer_satisfaction.count, id: Cardiology - customer_satisfaction.count,
            name: Cardiology}, {axisId: 'Cardiology,Healthy Screening - customer_satisfaction.count',
            id: 'Cardiology,Healthy Screening - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening'}, {axisId: 'Cardiology,Healthy Screening,Other Adult Genetics
              - customer_satisfaction.count', id: 'Cardiology,Healthy Screening,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cardiology,Neurology - customer_satisfaction.count',
            id: 'Cardiology,Neurology - customer_satisfaction.count', name: 'Cardiology,Neurology'},
          {axisId: 'Cardiology,Other Adult Genetics - customer_satisfaction.count',
            id: 'Cardiology,Other Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Other
              Adult Genetics'}, {axisId: Healthy Screening - customer_satisfaction.count,
            id: Healthy Screening - customer_satisfaction.count, name: Healthy Screening},
          {axisId: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            id: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            name: 'Healthy Screening,Other Adult Genetics'}, {axisId: 'Healthy Screening,Pediatrics
              - customer_satisfaction.count', id: 'Healthy Screening,Pediatrics -
              customer_satisfaction.count', name: 'Healthy Screening,Pediatrics'},
          {axisId: 'Healthy Screening,Prenatal - customer_satisfaction.count', id: 'Healthy
              Screening,Prenatal - customer_satisfaction.count', name: 'Healthy Screening,Prenatal'},
          {axisId: 'Healthy Screening,Reproductive - customer_satisfaction.count',
            id: 'Healthy Screening,Reproductive - customer_satisfaction.count', name: 'Healthy
              Screening,Reproductive'}, {axisId: Neurology - customer_satisfaction.count,
            id: Neurology - customer_satisfaction.count, name: Neurology}, {axisId: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', id: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', name: 'Neurology,Other
              Adult Genetics'}, {axisId: 'Neurology,Pediatrics - customer_satisfaction.count',
            id: 'Neurology,Pediatrics - customer_satisfaction.count', name: 'Neurology,Pediatrics'},
          {axisId: Other Adult Genetics - customer_satisfaction.count, id: Other Adult
              Genetics - customer_satisfaction.count, name: Other Adult Genetics},
          {axisId: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count',
            id: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count', name: 'Other
              Adult Genetics,Pediatrics'}, {axisId: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', id: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', name: 'Other Adult Genetics,Pharmacogenomics'},
          {axisId: 'Other Adult Genetics,Prenatal - customer_satisfaction.count',
            id: 'Other Adult Genetics,Prenatal - customer_satisfaction.count', name: 'Other
              Adult Genetics,Prenatal'}, {axisId: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', id: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', name: 'Other Adult Genetics,Reproductive'},
          {axisId: Pediatrics - customer_satisfaction.count, id: Pediatrics - customer_satisfaction.count,
            name: Pediatrics}, {axisId: Pharmacogenomics - customer_satisfaction.count,
            id: Pharmacogenomics - customer_satisfaction.count, name: Pharmacogenomics},
          {axisId: Prenatal - customer_satisfaction.count, id: Prenatal - customer_satisfaction.count,
            name: Prenatal}, {axisId: 'Prenatal,Reproductive - customer_satisfaction.count',
            id: 'Prenatal,Reproductive - customer_satisfaction.count', name: 'Prenatal,Reproductive'},
          {axisId: Reproductive - customer_satisfaction.count, id: Reproductive -
              customer_satisfaction.count, name: Reproductive}, {axisId: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, id: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, name: "∅"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Response value
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 21
    col: 5
    width: 19
    height: 8
  - name: 'Question 3: "I would recommend my GC to a friend/family member who needed
      genetic counseling"'
    type: text
    title_text: 'Question 3: "I would recommend my GC to a friend/family member who
      needed genetic counseling"'
    subtitle_text: ''
    body_text: ''
    row: 29
    col: 0
    width: 24
    height: 2
  - title: 'Question 3: Responses by Provider Specialties'
    name: 'Question 3: Responses by Provider Specialties'
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_column
    fields: [customer_satisfaction.count, customer_satisfaction.provider_indicated_specialty,
      customer_satisfaction.q180826659]
    pivots: [customer_satisfaction.provider_indicated_specialty]
    sorts: [customer_satisfaction.provider_indicated_specialty 0, customer_satisfaction.q180826659
        desc]
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    y_axes: [{label: Response count, orientation: left, series: [{axisId: " - customer_satisfaction.count",
            id: " - customer_satisfaction.count", name: Customer Satisfaction}, {
            axisId: ",Cancer - customer_satisfaction.count", id: ",Cancer - customer_satisfaction.count",
            name: ",Cancer"}, {axisId: ",Healthy Screening - customer_satisfaction.count",
            id: ",Healthy Screening - customer_satisfaction.count", name: ",Healthy\
              \ Screening"}, {axisId: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            id: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            name: ",Healthy Screening,Other Adult Genetics"}, {axisId: ",Neurology\
              \ - customer_satisfaction.count", id: ",Neurology - customer_satisfaction.count",
            name: ",Neurology"}, {axisId: ",Other Adult Genetics - customer_satisfaction.count",
            id: ",Other Adult Genetics - customer_satisfaction.count", name: ",Other\
              \ Adult Genetics"}, {axisId: ",Reproductive - customer_satisfaction.count",
            id: ",Reproductive - customer_satisfaction.count", name: ",Reproductive"},
          {axisId: Cancer - customer_satisfaction.count, id: Cancer - customer_satisfaction.count,
            name: Cancer}, {axisId: 'Cancer,Cardiology - customer_satisfaction.count',
            id: 'Cancer,Cardiology - customer_satisfaction.count', name: 'Cancer,Cardiology'},
          {axisId: 'Cancer,Healthy Screening - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening - customer_satisfaction.count', name: 'Cancer,Healthy Screening'},
          {axisId: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            id: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            name: 'Cancer,Healthy Screening,Neurology'}, {axisId: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', name: 'Cancer,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cancer,Neurology - customer_satisfaction.count',
            id: 'Cancer,Neurology - customer_satisfaction.count', name: 'Cancer,Neurology'},
          {axisId: 'Cancer,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cancer,Other Adult
              Genetics'}, {axisId: 'Cancer,Pediatrics - customer_satisfaction.count',
            id: 'Cancer,Pediatrics - customer_satisfaction.count', name: 'Cancer,Pediatrics'},
          {axisId: 'Cancer,Reproductive - customer_satisfaction.count', id: 'Cancer,Reproductive
              - customer_satisfaction.count', name: 'Cancer,Reproductive'}, {axisId: Cardiology
              - customer_satisfaction.count, id: Cardiology - customer_satisfaction.count,
            name: Cardiology}, {axisId: 'Cardiology,Healthy Screening - customer_satisfaction.count',
            id: 'Cardiology,Healthy Screening - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening'}, {axisId: 'Cardiology,Healthy Screening,Other Adult Genetics
              - customer_satisfaction.count', id: 'Cardiology,Healthy Screening,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cardiology,Neurology - customer_satisfaction.count',
            id: 'Cardiology,Neurology - customer_satisfaction.count', name: 'Cardiology,Neurology'},
          {axisId: 'Cardiology,Other Adult Genetics - customer_satisfaction.count',
            id: 'Cardiology,Other Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Other
              Adult Genetics'}, {axisId: Healthy Screening - customer_satisfaction.count,
            id: Healthy Screening - customer_satisfaction.count, name: Healthy Screening},
          {axisId: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            id: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            name: 'Healthy Screening,Other Adult Genetics'}, {axisId: 'Healthy Screening,Pediatrics
              - customer_satisfaction.count', id: 'Healthy Screening,Pediatrics -
              customer_satisfaction.count', name: 'Healthy Screening,Pediatrics'},
          {axisId: 'Healthy Screening,Prenatal - customer_satisfaction.count', id: 'Healthy
              Screening,Prenatal - customer_satisfaction.count', name: 'Healthy Screening,Prenatal'},
          {axisId: 'Healthy Screening,Reproductive - customer_satisfaction.count',
            id: 'Healthy Screening,Reproductive - customer_satisfaction.count', name: 'Healthy
              Screening,Reproductive'}, {axisId: Neurology - customer_satisfaction.count,
            id: Neurology - customer_satisfaction.count, name: Neurology}, {axisId: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', id: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', name: 'Neurology,Other
              Adult Genetics'}, {axisId: 'Neurology,Pediatrics - customer_satisfaction.count',
            id: 'Neurology,Pediatrics - customer_satisfaction.count', name: 'Neurology,Pediatrics'},
          {axisId: Other Adult Genetics - customer_satisfaction.count, id: Other Adult
              Genetics - customer_satisfaction.count, name: Other Adult Genetics},
          {axisId: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count',
            id: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count', name: 'Other
              Adult Genetics,Pediatrics'}, {axisId: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', id: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', name: 'Other Adult Genetics,Pharmacogenomics'},
          {axisId: 'Other Adult Genetics,Prenatal - customer_satisfaction.count',
            id: 'Other Adult Genetics,Prenatal - customer_satisfaction.count', name: 'Other
              Adult Genetics,Prenatal'}, {axisId: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', id: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', name: 'Other Adult Genetics,Reproductive'},
          {axisId: Pediatrics - customer_satisfaction.count, id: Pediatrics - customer_satisfaction.count,
            name: Pediatrics}, {axisId: Pharmacogenomics - customer_satisfaction.count,
            id: Pharmacogenomics - customer_satisfaction.count, name: Pharmacogenomics},
          {axisId: Prenatal - customer_satisfaction.count, id: Prenatal - customer_satisfaction.count,
            name: Prenatal}, {axisId: 'Prenatal,Reproductive - customer_satisfaction.count',
            id: 'Prenatal,Reproductive - customer_satisfaction.count', name: 'Prenatal,Reproductive'},
          {axisId: Reproductive - customer_satisfaction.count, id: Reproductive -
              customer_satisfaction.count, name: Reproductive}, {axisId: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, id: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, name: "∅"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Response value
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 31
    col: 5
    width: 19
    height: 7
  - title: Net Promoter Score (NPS)
    name: Net Promoter Score (NPS)
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count, customer_satisfaction.q180810987]
    pivots: [customer_satisfaction.q180810987]
    sorts: [customer_satisfaction.count desc 0, customer_satisfaction.q180810987]
    limit: 500
    column_limit: 29
    dynamic_fields: [{table_calculation: nps_numerator, label: NPS numerator, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)  - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps_denominator, label: NPS denominator,
        expression: "coalesce(pivot_where(${customer_satisfaction.q180810987} = \"\
          9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"10\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"Not at all likely - 0\", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"1\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"2\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"3\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"4\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"5\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"6\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"7\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"8\", ${customer_satisfaction.count}), 0)\n\n\n", value_format: !!null '',
        value_format_name: !!null '', is_disabled: false, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps_promoters_ratio, label: NPS promoters
          ratio, expression: 'round((coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)) * 100 / ${nps_denominator},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps_detractors_ratio, label: NPS
          detractors ratio, expression: 'round(${nps_detractors} * 100 / ${nps_denominator},
          0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
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
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    y_axes: [{label: Response count, orientation: left, series: [{axisId: " - customer_satisfaction.count",
            id: " - customer_satisfaction.count", name: Customer Satisfaction}, {
            axisId: ",Cancer - customer_satisfaction.count", id: ",Cancer - customer_satisfaction.count",
            name: ",Cancer"}, {axisId: ",Healthy Screening - customer_satisfaction.count",
            id: ",Healthy Screening - customer_satisfaction.count", name: ",Healthy\
              \ Screening"}, {axisId: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            id: ",Healthy Screening,Other Adult Genetics - customer_satisfaction.count",
            name: ",Healthy Screening,Other Adult Genetics"}, {axisId: ",Neurology\
              \ - customer_satisfaction.count", id: ",Neurology - customer_satisfaction.count",
            name: ",Neurology"}, {axisId: ",Other Adult Genetics - customer_satisfaction.count",
            id: ",Other Adult Genetics - customer_satisfaction.count", name: ",Other\
              \ Adult Genetics"}, {axisId: ",Reproductive - customer_satisfaction.count",
            id: ",Reproductive - customer_satisfaction.count", name: ",Reproductive"},
          {axisId: Cancer - customer_satisfaction.count, id: Cancer - customer_satisfaction.count,
            name: Cancer}, {axisId: 'Cancer,Cardiology - customer_satisfaction.count',
            id: 'Cancer,Cardiology - customer_satisfaction.count', name: 'Cancer,Cardiology'},
          {axisId: 'Cancer,Healthy Screening - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening - customer_satisfaction.count', name: 'Cancer,Healthy Screening'},
          {axisId: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            id: 'Cancer,Healthy Screening,Neurology - customer_satisfaction.count',
            name: 'Cancer,Healthy Screening,Neurology'}, {axisId: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Healthy
              Screening,Other Adult Genetics - customer_satisfaction.count', name: 'Cancer,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cancer,Neurology - customer_satisfaction.count',
            id: 'Cancer,Neurology - customer_satisfaction.count', name: 'Cancer,Neurology'},
          {axisId: 'Cancer,Other Adult Genetics - customer_satisfaction.count', id: 'Cancer,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cancer,Other Adult
              Genetics'}, {axisId: 'Cancer,Pediatrics - customer_satisfaction.count',
            id: 'Cancer,Pediatrics - customer_satisfaction.count', name: 'Cancer,Pediatrics'},
          {axisId: 'Cancer,Reproductive - customer_satisfaction.count', id: 'Cancer,Reproductive
              - customer_satisfaction.count', name: 'Cancer,Reproductive'}, {axisId: Cardiology
              - customer_satisfaction.count, id: Cardiology - customer_satisfaction.count,
            name: Cardiology}, {axisId: 'Cardiology,Healthy Screening - customer_satisfaction.count',
            id: 'Cardiology,Healthy Screening - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening'}, {axisId: 'Cardiology,Healthy Screening,Other Adult Genetics
              - customer_satisfaction.count', id: 'Cardiology,Healthy Screening,Other
              Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Healthy
              Screening,Other Adult Genetics'}, {axisId: 'Cardiology,Neurology - customer_satisfaction.count',
            id: 'Cardiology,Neurology - customer_satisfaction.count', name: 'Cardiology,Neurology'},
          {axisId: 'Cardiology,Other Adult Genetics - customer_satisfaction.count',
            id: 'Cardiology,Other Adult Genetics - customer_satisfaction.count', name: 'Cardiology,Other
              Adult Genetics'}, {axisId: Healthy Screening - customer_satisfaction.count,
            id: Healthy Screening - customer_satisfaction.count, name: Healthy Screening},
          {axisId: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            id: 'Healthy Screening,Other Adult Genetics - customer_satisfaction.count',
            name: 'Healthy Screening,Other Adult Genetics'}, {axisId: 'Healthy Screening,Pediatrics
              - customer_satisfaction.count', id: 'Healthy Screening,Pediatrics -
              customer_satisfaction.count', name: 'Healthy Screening,Pediatrics'},
          {axisId: 'Healthy Screening,Prenatal - customer_satisfaction.count', id: 'Healthy
              Screening,Prenatal - customer_satisfaction.count', name: 'Healthy Screening,Prenatal'},
          {axisId: 'Healthy Screening,Reproductive - customer_satisfaction.count',
            id: 'Healthy Screening,Reproductive - customer_satisfaction.count', name: 'Healthy
              Screening,Reproductive'}, {axisId: Neurology - customer_satisfaction.count,
            id: Neurology - customer_satisfaction.count, name: Neurology}, {axisId: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', id: 'Neurology,Other
              Adult Genetics - customer_satisfaction.count', name: 'Neurology,Other
              Adult Genetics'}, {axisId: 'Neurology,Pediatrics - customer_satisfaction.count',
            id: 'Neurology,Pediatrics - customer_satisfaction.count', name: 'Neurology,Pediatrics'},
          {axisId: Other Adult Genetics - customer_satisfaction.count, id: Other Adult
              Genetics - customer_satisfaction.count, name: Other Adult Genetics},
          {axisId: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count',
            id: 'Other Adult Genetics,Pediatrics - customer_satisfaction.count', name: 'Other
              Adult Genetics,Pediatrics'}, {axisId: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', id: 'Other Adult Genetics,Pharmacogenomics
              - customer_satisfaction.count', name: 'Other Adult Genetics,Pharmacogenomics'},
          {axisId: 'Other Adult Genetics,Prenatal - customer_satisfaction.count',
            id: 'Other Adult Genetics,Prenatal - customer_satisfaction.count', name: 'Other
              Adult Genetics,Prenatal'}, {axisId: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', id: 'Other Adult Genetics,Reproductive
              - customer_satisfaction.count', name: 'Other Adult Genetics,Reproductive'},
          {axisId: Pediatrics - customer_satisfaction.count, id: Pediatrics - customer_satisfaction.count,
            name: Pediatrics}, {axisId: Pharmacogenomics - customer_satisfaction.count,
            id: Pharmacogenomics - customer_satisfaction.count, name: Pharmacogenomics},
          {axisId: Prenatal - customer_satisfaction.count, id: Prenatal - customer_satisfaction.count,
            name: Prenatal}, {axisId: 'Prenatal,Reproductive - customer_satisfaction.count',
            id: 'Prenatal,Reproductive - customer_satisfaction.count', name: 'Prenatal,Reproductive'},
          {axisId: Reproductive - customer_satisfaction.count, id: Reproductive -
              customer_satisfaction.count, name: Reproductive}, {axisId: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, id: customer_satisfaction.provider_indicated_specialty___null
              - customer_satisfaction.count, name: "∅"}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Response value
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    hidden_fields: [customer_satisfaction.count, nps_numerator, nps_denominator, nps_promoters,
      nps_detractors]
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 0
    col: 0
    width: 5
    height: 8
  - title: Net Promoter Score - Monthly Trend
    name: Net Promoter Score - Monthly Trend
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_area
    fields: [customer_satisfaction.count, customer_satisfaction.q180810987, customer_satisfaction.last_completed_visit_dos_month]
    pivots: [customer_satisfaction.q180810987]
    fill_fields: [customer_satisfaction.last_completed_visit_dos_month]
    filters:
      customer_satisfaction.last_completed_visit_dos_month: 12 months
    sorts: [customer_satisfaction.count desc 0, customer_satisfaction.q180810987]
    limit: 500
    column_limit: 29
    dynamic_fields: [{table_calculation: nps_numerator, label: NPS numerator, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)  - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) - coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps_denominator, label: NPS denominator,
        expression: "coalesce(pivot_where(${customer_satisfaction.q180810987} = \"\
          9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"10\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"Not at all likely - 0\", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"1\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"2\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"3\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"4\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"5\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"6\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"7\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"8\", ${customer_satisfaction.count}), 0)\n\n\n", value_format: !!null '',
        value_format_name: !!null '', is_disabled: false, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: false, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps_promoters_ratio, label: NPS promoters
          ratio, expression: 'round(${nps_promoters} * 100 / ${nps_denominator}, 0)',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps_detractors_ratio, label: NPS
          detractors ratio, expression: 'round(${nps_detractors} * 100 / ${nps_denominator},
          0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
        reverse: true
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: nps, id: nps,
            name: NPS}, {axisId: nps_promoters_ratio, id: nps_promoters_ratio, name: NPS
              promotors}, {axisId: nps_detractors_ratio, id: nps_detractors_ratio,
            name: NPS detractors}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Date of Service Month
    series_types: {}
    series_colors: {}
    series_labels:
      nps_promoters_ratio: NPS promotors
      nps_detractors_ratio: NPS detractors
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: [customer_satisfaction.count, nps_numerator, nps_denominator, nps_promoters,
      nps_detractors]
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 0
    col: 5
    width: 19
    height: 8
  - title: GC CSAT (Question 2)
    name: GC CSAT (Question 2)
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count, customer_satisfaction.q180823390]
    pivots: [customer_satisfaction.q180823390]
    sorts: [customer_satisfaction.q180823390]
    limit: 500
    dynamic_fields: [{table_calculation: csat_disagree, label: CSAT disagree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_agree, label: CSAT agree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Strongly AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "AGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_neutral, label: CSAT neutral, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat, label: CSAT, expression: 'round(${csat_agree} * 100
          / (${csat_agree} + ${csat_disagree} + ${csat_neutral}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: customer_satisfaction.count,
            id: customer_satisfaction.count, name: Customer Satisfaction}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Response Value
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [csat_disagree, csat_agree, csat_neutral, customer_satisfaction.count]
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 21
    col: 0
    width: 5
    height: 8
  - title: GC CSAT (Question 3)
    name: GC CSAT (Question 3)
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count, customer_satisfaction.q180826659]
    pivots: [customer_satisfaction.q180826659]
    sorts: [customer_satisfaction.q180826659]
    limit: 500
    dynamic_fields: [{table_calculation: csat_disagree, label: CSAT disagree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_agree, label: CSAT agree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Strongly AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "AGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_neutral, label: CSAT neutral, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat, label: CSAT, expression: 'round(${csat_agree} * 100
          / (${csat_agree} + ${csat_disagree} + ${csat_neutral}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: customer_satisfaction.count,
            id: customer_satisfaction.count, name: Customer Satisfaction}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: Response Value
    series_types: {}
    series_colors: {}
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [csat_disagree, csat_agree, csat_neutral, customer_satisfaction.count]
    hidden_points_if_no: []
    series_labels: {}
    listen:
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Referral Program: customer_satisfaction.referral_program
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
      Latest Visit Provider: customer_satisfaction.latest_visit_provider
    row: 31
    col: 0
    width: 5
    height: 7
  filters:
  - name: Last Completed Visit Date of Service
    title: Last Completed Visit Date of Service
    type: field_filter
    default_value: last month
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: marketing_prod
    explore: customer_satisfaction
    listens_to_filters: []
    field: customer_satisfaction.last_completed_visit_dos_date
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
    model: marketing_prod
    explore: customer_satisfaction
    listens_to_filters: []
    field: customer_satisfaction.referral_program
  - name: Provider Indicated Specialty
    title: Provider Indicated Specialty
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: marketing_prod
    explore: customer_satisfaction
    listens_to_filters: []
    field: customer_satisfaction.provider_indicated_specialty
  - name: Latest Visit Provider
    title: Latest Visit Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: marketing_prod
    explore: customer_satisfaction
    listens_to_filters: []
    field: customer_satisfaction.latest_visit_provider
