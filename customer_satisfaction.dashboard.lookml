- dashboard: customer_satisfaction_v2
  title: Customer Satisfaction v2
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 'Question 1: GC CSAT'
    name: 'Question 1: GC CSAT'
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
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    custom_color: ''
    value_format: 0\%
    conditional_formatting: [{type: greater than, value: 89, background_color: "#cdffda",
        font_color: "#036108", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 90, background_color: "#fcc0c6",
        font_color: "#94051E", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
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
    note_state: collapsed
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 12
    col: 0
    width: 8
    height: 2
  - name: GC Visit Customer Satisfaction
    type: text
    title_text: GC Visit Customer Satisfaction
    subtitle_text: 'CSAT Question 1: "All of my questions were answered by my genetic
      counselor"'
    body_text: ''
    row: 10
    col: 0
    width: 24
    height: 2
  - title: CSAT Question 1 Responses
    name: CSAT Question 1 Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_pie
    fields: [customer_satisfaction.q180822923, customer_satisfaction.count, ranking]
    filters:
      customer_satisfaction.q180822923: "-NULL,-EMPTY"
    sorts: [ranking desc]
    limit: 500
    dynamic_fields: [{dimension: ranking, _kind_hint: dimension, _type_hint: number,
        category: dimension, expression: 'if(${customer_satisfaction.q180822923}="Strongly
          AGREE", 5, if(${customer_satisfaction.q180822923}= "AGREE", 4, if(${customer_satisfaction.q180822923}="Neither
          agree nor disagree",3, if(${customer_satisfaction.q180822923} = "DISAGREE",
          2, if(${customer_satisfaction.q180822923} = "Strongly DISAGREE",1,0)))))',
        label: ranking, value_format: !!null '', value_format_name: !!null ''}]
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: b20fe57d-cb13-420f-815b-60e907a43148
      options:
        steps: 5
        reverse: true
    series_colors:
      Strongly AGREE: "#683AAE"
    series_labels:
      Strongly AGREE: Strongly Agree
      AGREE: Agree
      DISAGREE: Disagree
      Strongly DISAGREE: Strongly Disagree
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [ranking]
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 14
    col: 8
    width: 8
    height: 6
  - name: GC Visit Customer Satisfaction (2)
    type: text
    title_text: GC Visit Customer Satisfaction
    subtitle_text: 'CSAT Question 2: "The info I learned from my genetic counseling
      session was valuable to me."'
    body_text: ''
    row: 20
    col: 0
    width: 24
    height: 2
  - name: GC Visit Customer Satisfaction (3)
    type: text
    title_text: GC Visit Customer Satisfaction
    subtitle_text: 'CSAT Question 3: "I would recommend my GC to a friend/family member
      who needed genetic counseling"'
    body_text: ''
    row: 30
    col: 0
    width: 24
    height: 2
  - title: Net Promoter Score (NPS)
    name: Net Promoter Score (NPS)
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count, customer_satisfaction.q180810987]
    pivots: [customer_satisfaction.q180810987]
    filters:
      customer_satisfaction.q180810987: "-NULL,-EMPTY"
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
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    custom_color: ''
    conditional_formatting: [{type: greater than, value: 69, background_color: "#cdffda",
        font_color: "#036108", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: b6d19921-b2be-4bb1-88be-73eb21d3861e}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 70, background_color: "#fcc0c6",
        font_color: "#94051e", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: b6d19921-b2be-4bb1-88be-73eb21d3861e}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 2
    col: 0
    width: 8
    height: 2
  - title: 'Question 2: GC CSAT'
    name: 'Question 2: GC CSAT'
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
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    value_format: 0\%
    conditional_formatting: [{type: greater than, value: 89, background_color: "#cdffda",
        font_color: "#036108", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 90, background_color: "#fcc0c6",
        font_color: "#94051e", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
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
    note_state: collapsed
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 22
    col: 0
    width: 8
    height: 2
  - title: 'Question 1: CSAT Score Monthly Trend'
    name: 'Question 1: CSAT Score Monthly Trend'
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_line
    fields: [customer_satisfaction.count, customer_satisfaction.last_completed_visit_dos_month,
      customer_satisfaction.q180823390]
    pivots: [customer_satisfaction.q180823390]
    fill_fields: [customer_satisfaction.last_completed_visit_dos_month]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180823390: "-NULL,-EMPTY"
    sorts: [customer_satisfaction.last_completed_visit_dos_month desc, customer_satisfaction.q180823390]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: csat_disagree,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', label: CSAT disagree,
        value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: supermeasure,
        table_calculation: csat_agree, _type_hint: number, category: table_calculation,
        expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390} = "Strongly
          AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "AGREE", ${customer_satisfaction.count}), 0)', label: CSAT agree, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: csat_neutral,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', label: CSAT
          neutral, value_format: !!null '', value_format_name: !!null ''}, {table_calculation: csat,
        label: CSAT, expression: 'round(${csat_agree} * 100 / (${csat_agree} + ${csat_disagree}
          + ${csat_neutral}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}]
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
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: b20fe57d-cb13-420f-815b-60e907a43148
      options:
        steps: 5
    y_axes: [{label: CSAT Score, orientation: left, series: [{axisId: csat, id: csat,
            name: CSAT}], showLabels: true, showValues: true, maxValue: 100, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month of Last Completed Visit DOS
    series_types: {}
    series_colors:
      csat: "#462C9D"
    series_labels: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#04c220",
        line_value: '90', label: Goal}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [csat_disagree, csat_agree, csat_neutral, customer_satisfaction.count]
    hidden_points_if_no: []
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 14
    col: 16
    width: 8
    height: 6
  - title: 2021 Question 1 CSAT
    name: 2021 Question 1 CSAT
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_donut_multiples
    fields: [customer_satisfaction.count, customer_satisfaction.q180822923]
    pivots: [customer_satisfaction.q180822923]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180822923: "-NULL,-EMPTY"
    sorts: [customer_satisfaction.q180822923]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: csat_agree, label: CSAT agree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "Strongly AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "AGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_neutral, label: CSAT neutral, expression: 'coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number},
      {table_calculation: csat_disagree, label: CSAT disagree, expression: 'coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180822923}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: number}]
    show_value_labels: true
    font_size: 12
    hide_legend: false
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: b20fe57d-cb13-420f-815b-60e907a43148
      options:
        steps: 5
        reverse: true
    series_colors:
      csat_agree: "#683AAE"
      csat_neutral: "#BB55B4"
      csat_disagree: "#EE9093"
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: customer_satisfaction.count,
            id: customer_satisfaction.count, name: Customer Satisfaction}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Response Value
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
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
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [customer_satisfaction.count, csat]
    hidden_points_if_no: []
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 14
    col: 0
    width: 8
    height: 6
  - title: Number of NPS Question Responses
    name: Number of NPS Question Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count]
    filters:
      customer_satisfaction.last_completed_visit_dos_year: NOT NULL
      customer_satisfaction.q180822923: Strongly AGREE,AGREE,DISAGREE,Neither agree
        nor disagree,Strongly DISAGREE,-NULL,-EMPTY
    sorts: [customer_satisfaction.count desc]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
        _type_hint: number, is_disabled: true}, {table_calculation: nps_denominator,
        label: NPS denominator, expression: "coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
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
        value_format_name: !!null '', is_disabled: true, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_promoters_ratio,
        label: NPS promoters ratio, expression: 'round((coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)) * 100 / ${nps_denominator},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors_ratio,
        label: NPS detractors ratio, expression: 'round(${nps_detractors} * 100 /
          ${nps_denominator}, 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}]
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
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    custom_color: ''
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
    hidden_fields: []
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Number of Completed Encounters
    name: Number of Completed Encounters
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.referral_channel: ''
      completed_encounters.encounter_type: "-scp"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: completed_encounters.referral_program
      Last Completed Visit Date of Service: completed_encounters.date_of_service_date
      Provider Indicated Specialty: completed_encounters.provider_indicated_specialty
    row: 2
    col: 16
    width: 8
    height: 2
  - title: NPS Responses by Score
    name: NPS Responses by Score
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_pie
    fields: [customer_satisfaction.count, customer_satisfaction.q180810987_numeric]
    filters:
      customer_satisfaction.q180810987_numeric: NOT NULL,NOT NULL,not 0
    sorts: [customer_satisfaction.q180810987_numeric desc]
    limit: 500
    column_limit: 50
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
        _type_hint: number, is_disabled: true}, {table_calculation: nps_denominator,
        label: NPS denominator, expression: "coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
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
        value_format_name: !!null '', is_disabled: true, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_promoters_ratio,
        label: NPS promoters ratio, expression: 'round(${nps_promoters} * 100 / ${nps_denominator},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors_ratio,
        label: NPS detractors ratio, expression: 'round(${nps_detractors} * 100 /
          ${nps_denominator}, 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}]
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
        reverse: true
    series_colors: {}
    series_labels:
      '0': '0'
      nps_promoters_ratio: NPS promotors
      nps_detractors_ratio: NPS detractors
      Not at all likely - 0: '0'
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: nps, id: nps,
            name: NPS}, {axisId: nps_promoters_ratio, id: nps_promoters_ratio, name: NPS
              promotors}, {axisId: nps_detractors_ratio, id: nps_detractors_ratio,
            name: NPS detractors}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Date of Service Month
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    font_size: '12'
    series_types: {}
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
    show_null_points: true
    interpolation: linear
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
    hidden_fields:
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 4
    col: 8
    width: 8
    height: 6
  - title: Monthly NPS Trend
    name: Monthly NPS Trend
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_line
    fields: [customer_satisfaction.count, customer_satisfaction.q180810987, customer_satisfaction.last_completed_visit_dos_month]
    pivots: [customer_satisfaction.q180810987]
    fill_fields: [customer_satisfaction.last_completed_visit_dos_month]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180810987: "-NULL,-EMPTY"
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
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    y_axes: [{label: NPS, orientation: left, series: [{axisId: nps, id: nps, name: NPS}],
        showLabels: true, showValues: true, maxValue: 100, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: Month of Last Completed Visit DOS
    series_types: {}
    series_colors:
      nps: "#9E7FD0"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#04c220",
        line_value: '70', label: Goal}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#B1399E"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    hidden_fields: [customer_satisfaction.count, nps_numerator, nps_denominator, nps_promoters,
      nps_detractors, nps_promoters_ratio, nps_detractors_ratio]
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 4
    col: 16
    width: 8
    height: 6
  - name: NET PROMOTER SCORE
    type: text
    title_text: NET PROMOTER SCORE
    subtitle_text: 'Survey Question: "How likely is it that you would recommend Genome
      Medical to a friend or colleague?"'
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Portion of Net Promoters
    name: Portion of Net Promoters
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_donut_multiples
    fields: [customer_satisfaction.count, customer_satisfaction.q180810987]
    pivots: [customer_satisfaction.q180810987]
    filters:
      customer_satisfaction.q180810987: "-NULL,-EMPTY"
      customer_satisfaction.latest_visit_provider: ''
    sorts: [customer_satisfaction.q180810987, customer_satisfaction.count desc 10]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: nps_promoter, _type_hint: number,
        category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', label: NPS Promoter, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: nps_passive,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "8", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "7", ${customer_satisfaction.count}), 0)', label: NPS Passive, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: nps_detractor,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', label: NPS Detractor, value_format: !!null '', value_format_name: !!null ''}]
    show_value_labels: true
    font_size: '12'
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
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
    show_null_points: true
    interpolation: linear
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
    hidden_fields: [customer_satisfaction.count, nps_numerator, nps_denominator, nps,
      nps_promoters_ratio, nps_detractors_ratio]
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 4
    col: 0
    width: 8
    height: 6
  - title: Number of Completed Encounters
    name: Number of Completed Encounters (2)
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.referral_channel: ''
      completed_encounters.encounter_type: "-scp"
    limit: 500
    column_limit: 50
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
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    custom_color: ''
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: completed_encounters.referral_program
      Last Completed Visit Date of Service: completed_encounters.date_of_service_date
      Provider Indicated Specialty: completed_encounters.provider_indicated_specialty
    row: 12
    col: 16
    width: 8
    height: 2
  - title: Number of CSAT Question 1 Responses
    name: Number of CSAT Question 1 Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count]
    filters:
      customer_satisfaction.last_completed_visit_dos_year: NOT NULL
      customer_satisfaction.q180822923: AGREE,DISAGREE,Neither agree nor disagree,Strongly
        AGREE,Strongly DISAGREE,-NULL,-EMPTY
    sorts: [customer_satisfaction.count desc]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
        _type_hint: number, is_disabled: true}, {table_calculation: nps_denominator,
        label: NPS denominator, expression: "coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
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
        value_format_name: !!null '', is_disabled: true, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_promoters_ratio,
        label: NPS promoters ratio, expression: 'round((coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)) * 100 / ${nps_denominator},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors_ratio,
        label: NPS detractors ratio, expression: 'round(${nps_detractors} * 100 /
          ${nps_denominator}, 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}]
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
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    custom_color: ''
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
    hidden_fields: []
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 12
    col: 8
    width: 8
    height: 2
  - title: Number of Completed Encounters
    name: Number of Completed Encounters (3)
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.referral_channel: ''
      completed_encounters.encounter_type: "-scp"
    limit: 500
    column_limit: 50
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
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    custom_color: ''
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: completed_encounters.referral_program
      Last Completed Visit Date of Service: completed_encounters.date_of_service_date
      Provider Indicated Specialty: completed_encounters.provider_indicated_specialty
    row: 22
    col: 16
    width: 8
    height: 2
  - title: Number of CSAT Question 2 Responses
    name: Number of CSAT Question 2 Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count]
    filters:
      customer_satisfaction.last_completed_visit_dos_year: NOT NULL
      customer_satisfaction.q180823390: AGREE,DISAGREE,Neither agree nor disagree,Strongly
        AGREE,Strongly DISAGREE,-EMPTY,-NULL
    sorts: [customer_satisfaction.count desc]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
        _type_hint: number, is_disabled: true}, {table_calculation: nps_denominator,
        label: NPS denominator, expression: "coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
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
        value_format_name: !!null '', is_disabled: true, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_promoters_ratio,
        label: NPS promoters ratio, expression: 'round((coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)) * 100 / ${nps_denominator},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors_ratio,
        label: NPS detractors ratio, expression: 'round(${nps_detractors} * 100 /
          ${nps_denominator}, 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}]
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
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    custom_color: ''
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
    hidden_fields: []
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 22
    col: 8
    width: 8
    height: 2
  - title: 2021 Question 2 CSAT
    name: 2021 Question 2 CSAT
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_donut_multiples
    fields: [customer_satisfaction.count, customer_satisfaction.q180823390]
    pivots: [customer_satisfaction.q180823390]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180823390: "-NULL,-EMPTY"
    sorts: [customer_satisfaction.q180823390]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: csat_agree, _type_hint: number,
        category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Strongly AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "AGREE", ${customer_satisfaction.count}), 0)', label: CSAT agree, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: csat_neutral,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', label: CSAT
          neutral, value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: supermeasure,
        table_calculation: csat_disagree, _type_hint: number, category: table_calculation,
        expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390} = "Strongly
          DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', label: CSAT disagree,
        value_format: !!null '', value_format_name: !!null ''}]
    show_value_labels: true
    font_size: 12
    hide_legend: false
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: 04e6ee8f-6a09-4649-891f-5bc66082e506
      options:
        steps: 5
        reverse: true
    series_colors:
      csat_agree: "#BB55B4"
      csat_neutral: "#FDA08A"
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: customer_satisfaction.count,
            id: customer_satisfaction.count, name: Customer Satisfaction}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Response Value
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
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
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [customer_satisfaction.count, csat]
    hidden_points_if_no: []
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 24
    col: 0
    width: 8
    height: 6
  - title: CSAT Question 2 Responses
    name: CSAT Question 2 Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_pie
    fields: [customer_satisfaction.count, customer_satisfaction.q180823390, ranking]
    filters:
      customer_satisfaction.q180823390: "-NULL,-EMPTY"
    sorts: [ranking desc]
    limit: 500
    dynamic_fields: [{dimension: ranking, _kind_hint: dimension, _type_hint: number,
        category: dimension, expression: 'if(${customer_satisfaction.q180823390}="Strongly
          AGREE", 5, if(${customer_satisfaction.q180823390}= "AGREE", 4, if(${customer_satisfaction.q180823390}="Neither
          agree nor disagree",3, if(${customer_satisfaction.q180823390} = "DISAGREE",
          2, if(${customer_satisfaction.q180823390} = "Strongly DISAGREE",1,0)))))',
        label: ranking, value_format: !!null '', value_format_name: !!null ''}]
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: 04e6ee8f-6a09-4649-891f-5bc66082e506
      options:
        steps: 5
        reverse: true
    series_colors:
      Strongly AGREE: "#BB55B4"
      AGREE: "#D978A1"
    series_labels:
      Strongly AGREE: Strongly Agree
      AGREE: Agree
      DISAGREE: Disagree
      Strongly DISAGREE: Strongly Disagree
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [ranking]
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 24
    col: 8
    width: 8
    height: 6
  - title: 'Question 2: CSAT Score Monthly Trend'
    name: 'Question 2: CSAT Score Monthly Trend'
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_line
    fields: [customer_satisfaction.count, customer_satisfaction.last_completed_visit_dos_month,
      customer_satisfaction.q180823390]
    pivots: [customer_satisfaction.q180823390]
    fill_fields: [customer_satisfaction.last_completed_visit_dos_month]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180823390: "-NULL,-EMPTY"
    sorts: [customer_satisfaction.last_completed_visit_dos_month desc, customer_satisfaction.q180823390]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: csat_disagree,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', label: CSAT disagree,
        value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: supermeasure,
        table_calculation: csat_agree, _type_hint: number, category: table_calculation,
        expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390} = "Strongly
          AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "AGREE", ${customer_satisfaction.count}), 0)', label: CSAT agree, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: csat_neutral,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180823390}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', label: CSAT
          neutral, value_format: !!null '', value_format_name: !!null ''}, {table_calculation: csat,
        label: CSAT, expression: 'round(${csat_agree} * 100 / (${csat_agree} + ${csat_disagree}
          + ${csat_neutral}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}]
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
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: 04e6ee8f-6a09-4649-891f-5bc66082e506
      options:
        steps: 5
    y_axes: [{label: CSAT Score, orientation: left, series: [{axisId: csat, id: csat,
            name: CSAT}], showLabels: true, showValues: true, maxValue: 100, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month of Last Completed Visit DOS
    series_types: {}
    series_colors:
      csat: "#BB55B4"
    series_labels: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#04c220",
        line_value: '90', label: Goal}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [csat_disagree, csat_agree, csat_neutral, customer_satisfaction.count]
    hidden_points_if_no: []
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 24
    col: 16
    width: 8
    height: 6
  - title: 'Question 3: GC CSAT'
    name: 'Question 3: GC CSAT'
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count, customer_satisfaction.q180826659]
    pivots: [customer_satisfaction.q180826659]
    filters:
      customer_satisfaction.q180826659: "-EMPTY,-NULL"
    sorts: [customer_satisfaction.q180826659]
    limit: 500
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: csat_disagree,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', label: CSAT disagree,
        value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: supermeasure,
        table_calculation: csat_agree, _type_hint: number, category: table_calculation,
        expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659} = "Strongly
          AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "AGREE", ${customer_satisfaction.count}), 0)', label: CSAT agree, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: csat_neutral,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', label: CSAT
          neutral, value_format: !!null '', value_format_name: !!null ''}, {table_calculation: csat,
        label: CSAT, expression: 'round(${csat_agree} * 100 / (${csat_agree} + ${csat_disagree}
          + ${csat_neutral}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a
      palette_id: a3f9463f-88e2-450e-9363-9525c96ecd6d
      options:
        steps: 5
    value_format: 0\%
    conditional_formatting: [{type: greater than, value: 89, background_color: "#cdffda",
        font_color: "#036108", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 90, background_color: "#fcc0c6",
        font_color: "#94051e", color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
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
    note_state: collapsed
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 32
    col: 0
    width: 8
    height: 2
  - title: Number of CSAT Question 3 Responses
    name: Number of CSAT Question 3 Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: single_value
    fields: [customer_satisfaction.count]
    filters:
      customer_satisfaction.last_completed_visit_dos_year: NOT NULL
      customer_satisfaction.q180826659: AGREE,DISAGREE,Neither agree nor disagree,Strongly
        AGREE,Strongly DISAGREE,-NULL,-EMPTY
    sorts: [customer_satisfaction.count desc]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
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
        _type_hint: number, is_disabled: true}, {table_calculation: nps_denominator,
        label: NPS denominator, expression: "coalesce(pivot_where(${customer_satisfaction.q180810987}\
          \ = \"9\", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}\
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
        value_format_name: !!null '', is_disabled: true, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: nps, label: NPS, expression: 'round(${nps_numerator}
          * 100/${nps_denominator}, 0)', value_format: !!null '', value_format_name: !!null '',
        is_disabled: true, _kind_hint: supermeasure, _type_hint: number}, {table_calculation: nps_promoters,
        label: NPS promoters, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors,
        label: NPS detractors, expression: 'coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "Not at all likely - 0", ${customer_satisfaction.count}), 0) +  coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "1", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "2", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "3", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "4", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "5", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "6", ${customer_satisfaction.count}), 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_promoters_ratio,
        label: NPS promoters ratio, expression: 'round((coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "9", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180810987}
          = "10", ${customer_satisfaction.count}), 0)) * 100 / ${nps_denominator},
          0)', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}, {table_calculation: nps_detractors_ratio,
        label: NPS detractors ratio, expression: 'round(${nps_detractors} * 100 /
          ${nps_denominator}, 0)

          ', value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number, is_disabled: true}]
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
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
      options:
        steps: 5
    custom_color: ''
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
    hidden_fields: []
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 32
    col: 8
    width: 8
    height: 2
  - title: Number of Completed Encounters
    name: Number of Completed Encounters (4)
    model: biz_ops_prod
    explore: completed_encounters
    type: single_value
    fields: [completed_encounters.count_completed_encounters]
    filters:
      completed_encounters.referral_channel: ''
      completed_encounters.encounter_type: "-scp"
    limit: 500
    column_limit: 50
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
      palette_id: 93f8aeb4-3f4a-4cd7-8fee-88c3417516a1
    custom_color: ''
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    note_state: expanded
    note_display: below
    note_text: within Last Completed Visit Date of Service Range
    listen:
      Referral Program: completed_encounters.referral_program
      Last Completed Visit Date of Service: completed_encounters.date_of_service_date
      Provider Indicated Specialty: completed_encounters.provider_indicated_specialty
    row: 32
    col: 16
    width: 8
    height: 2
  - title: 2021 Question 3 CSAT
    name: 2021 Question 3 CSAT
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_donut_multiples
    fields: [customer_satisfaction.count, customer_satisfaction.q180826659]
    pivots: [customer_satisfaction.q180826659]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180826659: "-NULL,-EMPTY"
    sorts: [customer_satisfaction.q180826659]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: csat_agree, _type_hint: number,
        category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Strongly AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "AGREE", ${customer_satisfaction.count}), 0)', label: CSAT agree, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: csat_neutral,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', label: CSAT
          neutral, value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: supermeasure,
        table_calculation: csat_disagree, _type_hint: number, category: table_calculation,
        expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659} = "Strongly
          DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', label: CSAT disagree,
        value_format: !!null '', value_format_name: !!null ''}]
    show_value_labels: true
    font_size: 12
    hide_legend: false
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: a418cd33-fecf-4932-9933-dbd6652c610b
      options:
        steps: 5
        reverse: false
    series_colors:
      csat_agree: "#170658"
      csat_neutral: "#462C9D"
      csat_disagree: "#8643B1"
    series_labels: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Response Count, orientation: left, series: [{axisId: customer_satisfaction.count,
            id: customer_satisfaction.count, name: Customer Satisfaction}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Response Value
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
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
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [customer_satisfaction.count, csat]
    hidden_points_if_no: []
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 34
    col: 0
    width: 8
    height: 6
  - title: CSAT Question 3 Responses
    name: CSAT Question 3 Responses
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_pie
    fields: [customer_satisfaction.count, customer_satisfaction.q180826659, ranking]
    filters:
      customer_satisfaction.q180826659: "-NULL,-EMPTY"
    sorts: [ranking desc]
    limit: 500
    dynamic_fields: [{dimension: ranking, _kind_hint: dimension, _type_hint: number,
        category: dimension, expression: 'if(${customer_satisfaction.q180826659}="Strongly
          AGREE", 5, if(${customer_satisfaction.q180826659}= "AGREE", 4, if(${customer_satisfaction.q180826659}="Neither
          agree nor disagree",3, if(${customer_satisfaction.q180826659} = "DISAGREE",
          2, if(${customer_satisfaction.q180826659} = "Strongly DISAGREE",1,0)))))',
        label: ranking, value_format: !!null '', value_format_name: !!null ''}]
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: f582184b-9f56-4e5b-b1ab-e9777faa4df9
      options:
        steps: 5
        reverse: true
    series_colors: {}
    series_labels:
      Strongly AGREE: Strongly Agree
      AGREE: Agree
      DISAGREE: Disagree
      Strongly DISAGREE: Strongly Disagree
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
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: [ranking]
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 34
    col: 8
    width: 8
    height: 6
  - title: 'Question 3: CSAT Score Monthly Trend'
    name: 'Question 3: CSAT Score Monthly Trend'
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_line
    fields: [customer_satisfaction.count, customer_satisfaction.last_completed_visit_dos_month,
      customer_satisfaction.q180826659]
    pivots: [customer_satisfaction.q180826659]
    fill_fields: [customer_satisfaction.last_completed_visit_dos_month]
    filters:
      customer_satisfaction.latest_visit_provider: ''
      customer_satisfaction.q180826659: "-NULL,-EMPTY"
    sorts: [customer_satisfaction.last_completed_visit_dos_month desc, customer_satisfaction.q180826659]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: supermeasure, table_calculation: csat_disagree,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Strongly DISAGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "DISAGREE", ${customer_satisfaction.count}), 0)', label: CSAT disagree,
        value_format: !!null '', value_format_name: !!null ''}, {_kind_hint: supermeasure,
        table_calculation: csat_agree, _type_hint: number, category: table_calculation,
        expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659} = "Strongly
          AGREE", ${customer_satisfaction.count}), 0) + coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "AGREE", ${customer_satisfaction.count}), 0)', label: CSAT agree, value_format: !!null '',
        value_format_name: !!null ''}, {_kind_hint: supermeasure, table_calculation: csat_neutral,
        _type_hint: number, category: table_calculation, expression: 'coalesce(pivot_where(${customer_satisfaction.q180826659}
          = "Neither agree nor disagree", ${customer_satisfaction.count}), 0)', label: CSAT
          neutral, value_format: !!null '', value_format_name: !!null ''}, {table_calculation: csat,
        label: CSAT, expression: 'round(${csat_agree} * 100 / (${csat_agree} + ${csat_disagree}
          + ${csat_neutral}), 0)', value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: number}]
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
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: f582184b-9f56-4e5b-b1ab-e9777faa4df9
      options:
        steps: 5
    y_axes: [{label: CSAT Score, orientation: left, series: [{axisId: csat, id: csat,
            name: CSAT}], showLabels: true, showValues: true, maxValue: 100, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month of Last Completed Visit DOS
    series_types: {}
    series_colors:
      csat: "#170658"
    series_labels: {}
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#04c220",
        line_value: '90', label: Goal}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: 0\%
    conditional_formatting: [{type: equal to, value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: 1297ec12-86a5-4ae0-9dfc-82de70b3806a,
          palette_id: 99d2d3ac-7579-41a0-b16c-a381b7ae96da}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    value_labels: legend
    label_type: labPer
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [csat_disagree, csat_agree, csat_neutral, customer_satisfaction.count]
    hidden_points_if_no: []
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 34
    col: 16
    width: 8
    height: 6
  - title: Untitled
    name: Untitled
    model: marketing_prod
    explore: customer_satisfaction
    type: looker_grid
    fields: [customer_satisfaction.last_completed_visit_dos_month, customer_satisfaction.referral_program,
      customer_satisfaction.q180825910]
    filters:
      customer_satisfaction.q180825910: "-EMPTY"
    sorts: [customer_satisfaction.last_completed_visit_dos_month desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: false
    table_theme: editable
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
    title_hidden: true
    listen:
      Referral Program: customer_satisfaction.referral_program
      Last Completed Visit Date of Service: customer_satisfaction.last_completed_visit_dos_date
      Provider Indicated Specialty: customer_satisfaction.provider_indicated_specialty
    row: 40
    col: 0
    width: 24
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: How is the Net Promoter Score (NPS) calculated?
    body_text: "Net Promoter Score is determined by subtracting the percentage of\
      \ customers who are detractors from the percentage who are promoters. \nThe\
      \ Net Promoter Score can fall anywhere between -100 (all detractors) and 100\
      \ (all promoters).\n**Surveyors answer a question based on a 1-10 ranking.**\
      \ *Promoter = 10 or 9; Passive = 8 or 7; Detractor = 6, 5, 4, 3, 2, or 1*"
    row: 46
    col: 0
    width: 12
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: How is the Customer Satisfaction (CSAT) score calculated?
    body_text: 'Customer Satisfaction score is determined by taking the percentage
      of all satisfied customers. Satisfaction can be measured by a variety of questions
      based on the services provided, Genome Medical uses three main questions to
      survey satisfaction. **Surveyors answer a question based on a 1-5 scale.** *Positive
      satisfaction: Strongly Agree (5), and Agree (4). Neutral satisfaction: Neither
      agree nor disagree (3). Negative satisfaction: Disagree (2), and Strongly Disagree
      (1).*'
    row: 46
    col: 12
    width: 12
    height: 4
  filters:
  - name: Last Completed Visit Date of Service
    title: Last Completed Visit Date of Service
    type: field_filter
    default_value: this year to second
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
    listens_to_filters: [Last Completed Visit Date of Service, Provider Indicated
        Specialty]
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
    listens_to_filters: [Last Completed Visit Date of Service, Referral Program]
    field: customer_satisfaction.provider_indicated_specialty
