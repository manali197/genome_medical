connection: "analytics_db"

include: "/views/*.view.lkml"

explore: encounter_details {
  persist_for: "5 minutes"
  join: patient_encounter_summary {
    type: left_outer
    sql_on: ${patient_encounter_summary.patient_uuid} = ${encounter_details.user_uuid} ;;
    relationship: many_to_one
  }
  join: gene_test_orders {
    type: left_outer
    sql_on: ${encounter_details.encounter_uuid} = ${gene_test_orders.encounter_uuid} ;;
    relationship: one_to_many
  }
  join: gene_test_results {
    type: left_outer
    sql_on: ${gene_test_orders.order_uuid} = ${gene_test_results.order_uuid} ;;
    relationship: one_to_many
  }
}

explore: customer_satisfaction {
  persist_for: "5 minutes"
  join: patient_encounter_summary {
    type: left_outer
    sql_on: ${patient_encounter_summary.patient_email} = ${customer_satisfaction.email_address} OR
      ${patient_encounter_summary.patient_email} = ${customer_satisfaction.email};;
    relationship: one_to_many
  }
}
