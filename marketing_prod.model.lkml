connection: "analytics_db"

include: "/views/*.view.lkml"

explore: completed_encounters {
  persist_for: "5 minutes"
  join: patient_encounter_summary {
    type: left_outer
    sql_on: ${patient_encounter_summary.patient_email} = ${completed_encounters.patient_email} ;;
    relationship: many_to_one
  }
  join: gene_test_orders {
    type: left_outer
    sql_on: ${completed_encounters.encounter_uuid} = ${gene_test_orders.encounter_uuid} ;;
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
