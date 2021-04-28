view: gene_test_orders {
  sql_table_name: public.gene_test_orders ;;

  dimension: clinician_comments {
    type: string
    sql: ${TABLE}."clinician_comments" ;;
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

  dimension_group: date_received_report {
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
    sql: ${TABLE}."date_received_report" ;;
  }

  dimension_group: date_results_released_to_patient {
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
    sql: ${TABLE}."date_results_released_to_patient" ;;
  }

  dimension_group: date_test_authorized {
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
    sql: ${TABLE}."date_test_authorized" ;;
  }

  dimension_group: date_test_ordered {
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
    sql: ${TABLE}."date_test_ordered" ;;
  }

  dimension: encounter_uuid {
    type: string
    sql: ${TABLE}."encounter_uuid" ;;
  }

  dimension_group: expected_lab_results {
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
    sql: ${TABLE}."expected_lab_results_date" ;;
  }

  dimension: external_id {
    type: number
    sql: ${TABLE}."external_id" ;;
  }

  dimension: has_sent_test_notification {
    type: yesno
    sql: ${TABLE}."has_sent_test_notification" ;;
  }

  dimension: hpo {
    type: string
    sql: ${TABLE}."hpo" ;;
  }

  dimension: indication {
    type: string
    sql: ${TABLE}."indication" ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}."order_status" ;;
  }

  dimension: order_status_display_name {
    type: string
    sql: CASE WHEN ${TABLE}."order_status" = 'patient_undecided' THEN 'Patient Undecided'
          WHEN ${TABLE}."order_status" = 'patient_declined' THEN 'Patient Declined'
          WHEN ${TABLE}."order_status" = 'requested' THEN 'Requested'
          WHEN ${TABLE}."order_status" = 'rejected' THEN 'Rejected'
          WHEN ${TABLE}."order_status" = 'awaiting_external_approval' THEN 'Awaiting External Approval'
          WHEN ${TABLE}."order_status" = 'approved' THEN 'Approved'
          WHEN ${TABLE}."order_status" = 'waiting_to_submit' THEN 'Waiting to Submit'
          WHEN ${TABLE}."order_status" = 'cancelled' THEN 'Cancelled'
          WHEN ${TABLE}."order_status" = 'patient_not_responsive' THEN 'Patient Not Responsive'
          WHEN ${TABLE}."order_status" = 'sent_to_lab' THEN 'Sent to Lab'
          WHEN ${TABLE}."order_status" = 'sample_not_submitted' THEN 'Sample Not Submitted'
          WHEN ${TABLE}."order_status" = 'results_ready' THEN 'Results Ready'
          WHEN ${TABLE}."order_status" = 'results_entered' THEN 'Results Entered'
          WHEN ${TABLE}."order_status" is null THEN 'N/A'
          ELSE ${TABLE}."order_status" END ;;
    drill_fields: [status_reason_display_name]
  }

  dimension: status_reason {
    type: string
    sql: ${TABLE}."status_reason" ;;
  }

  dimension: status_reason_display_name {
    type: string
    sql: CASE WHEN ${TABLE}."status_reason" = 'declined_other' THEN 'Declined - other'
          WHEN ${TABLE}."status_reason" = 'no_fu_from_patient' THEN 'No follow-up from patient'
          WHEN ${TABLE}."status_reason" = 'iss_w_test_implications' THEN 'Iss w/ test implications'
          WHEN ${TABLE}."status_reason" = 'ins_denied_cost' THEN 'Insurance denied/cost'
          WHEN ${TABLE}."status_reason" = 'rejected_other' THEN 'Rejected - other'
          WHEN ${TABLE}."status_reason" = 'no_test_available' THEN 'No test available'
          WHEN ${TABLE}."status_reason" = 'awaiting_information_gc' THEN 'Awaiting Information (GC)'
          WHEN ${TABLE}."status_reason" = 'awaiting_information_patient' THEN 'Awaiting Information (Patient)'
          WHEN ${TABLE}."status_reason" = 'awaiting_benefits_investigation' THEN 'Awaiting Benefits Investigation'
          WHEN ${TABLE}."status_reason" = 'awaiting_birth' THEN 'Awaiting Birth'
          WHEN ${TABLE}."status_reason" = 'order_cancelled_by_patient' THEN 'Order Cancelled by Patient'
          WHEN ${TABLE}."status_reason" = 'order_cancelled_by_provider' THEN 'Order Cancelled by Provider'
          WHEN ${TABLE}."status_reason" = 'awaiting_cc_submission' THEN 'Awaiting CC Submission'
          WHEN ${TABLE}."status_reason" = 'result_positive_with_genes' THEN 'Findings entered'
          WHEN ${TABLE}."status_reason" = 'result_positive_no_genes' THEN 'Findings, Awaiting Entry'
          WHEN ${TABLE}."status_reason" = 'result_negative' THEN '-ve, No Findings'
          WHEN ${TABLE}."status_reason" = 'order_cancelled_by_lab' THEN 'Order Cancelled by Lab'
          WHEN ${TABLE}."status_reason" is null THEN 'N/A'
          ELSE ${TABLE}."status_reason" END ;;
    drill_fields: [order_status_display_name]
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: order_uuid {
    type: string
    primary_key: yes
    sql: ${TABLE}."order_uuid" ;;
  }

  dimension: ordering_physician {
    type: string
    sql: ${TABLE}."ordering_physician" ;;
  }

  dimension: patient_billing_method {
    type: string
    sql: ${TABLE}."patient_billing_method" ;;
  }

  dimension: positive_results_to_report {
    type: yesno
    sql: ${TABLE}."positive_results_to_report" ;;
  }

  dimension: sample_type {
    type: string
    sql: ${TABLE}."sample_type" ;;
  }

  dimension: test_outreach_status {
    type: string
    sql: ${TABLE}."test_outreach_status" ;;
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

  dimension: gene_test_display_name {
    type:  string
    sql:  ${TABLE}."gene_test_display_name" ;;
  }

  dimension: gene_test_classification {
    type:  string
    sql: ${TABLE}."gene_test_classification" ;;
  }

  dimension: genetic_test_type {
    type:  string
    sql:${TABLE}."genetic_test_type" ;;
  }

  dimension: lab_name {
    type:  string
    sql:${TABLE}."lab_name" ;;
  }

  dimension: lab_display_name {
    type:  string
    sql:${TABLE}."lab_display_name" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_not_null_orders {
    type: count
    filters: [date_test_ordered_date: "-NULL"]
    drill_fields: [lab_display_name, count_not_null_orders]
    link: {
      label: "Drill by genetic test type"
      url: "{{ link }}&fields=gene_test_orders.genetic_test_type,gene_test_orders.count_not_null_orders"
    }
    link: {
      label: "Drill by Referral Program"
      url: "{{ link }}&fields=patient_encounter_summary.referral_program,gene_test_orders.count_not_null_orders"
    }
  }
}
