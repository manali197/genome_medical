view: gene_test_results {
  sql_table_name: public.gene_test_results ;;

  dimension: c_dna_pos {
    type: string
    sql: ${TABLE}."c_dna_pos" ;;
  }

  dimension: clinician_comments {
    type: string
    sql: ${TABLE}."clinician_comments" ;;
  }

  dimension: clinvar_id {
    type: string
    sql: ${TABLE}."clinvar_id" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: gene_chromosome {
    type: string
    sql: ${TABLE}."gene_chromosome" ;;
  }

  dimension: gene_description {
    type: string
    sql: ${TABLE}."gene_description" ;;
  }

  dimension: gene_name {
    type: string
    sql: ${TABLE}."gene_name" ;;
  }

  dimension: genotype {
    type: string
    sql: ${TABLE}."genotype" ;;
  }

  dimension: haplotype {
    type: string
    sql: ${TABLE}."haplotype" ;;
  }

  dimension: interpretation {
    type: string
    sql: ${TABLE}."interpretation" ;;
  }

  dimension: lab_comments {
    type: string
    sql: ${TABLE}."lab_comments" ;;
  }

  dimension: non_gene_test_type {
    type: string
    sql: ${TABLE}."non_gene_test_type" ;;
  }

  dimension: order_uuid {
    type: string
    sql: ${TABLE}."order_uuid" ;;
  }

  dimension: p_position {
    type: string
    sql: ${TABLE}."p_position" ;;
  }

  dimension: result_uuid {
    type: string
    primary_key: yes
    sql: ${TABLE}."result_uuid" ;;
  }

  dimension: risk_score {
    type: string
    sql: ${TABLE}."risk_score" ;;
  }

  dimension: rs_id {
    type: string
    sql: ${TABLE}."rs_id" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."updated_at" ;;
  }

  dimension: zygosity {
    type: string
    sql: ${TABLE}."zygosity" ;;
  }


  dimension: orders_with_results_entered {
    type: yesno
    sql: ${gene_test_orders.order_status} = 'results_entered';;
  }

  measure: count {
    type: count
    drill_fields: [gene_name]
  }
}
