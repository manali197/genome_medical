connection: "analytics_db"

include: "/views/*.view.lkml"
include: "business_operations_v2.dashboard"

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
  join: encounter_medical_codes {
    type: left_outer
    sql_on: ${encounter_medical_codes.encounter_uuid} = ${completed_encounters.encounter_uuid} ;;
    relationship: one_to_many
  }
  join: encounter_medical_code_details {
    from: medical_codes
    type: left_outer
    sql_on: ${encounter_medical_codes.medical_code_uuid} = ${encounter_medical_code_details.uuid} ;;
    relationship: one_to_one
  }
  join: gene_test_orders_medical_codes {
    type: left_outer
    sql_on: ${gene_test_orders_medical_codes.gene_test_order_id} = ${gene_test_orders.id} ;;
    relationship: one_to_many
  }
  join: gene_test_orders_medical_code_details {
    from: medical_codes
    type: left_outer
    sql_on: ${gene_test_orders_medical_codes.medical_code_uuid} = ${gene_test_orders_medical_code_details.uuid} ;;
    relationship: one_to_one
  }
  join: providers {
    type: left_outer
    sql_on: ${completed_encounters.visit_provider} = concat_ws(' ', ${providers.first_name}, ${providers.last_name}) ;;
    relationship: one_to_one
  }
  join: gmi_provider_details {
    type: left_outer
    sql_on: ${providers.uuid} = ${gmi_provider_details.provider_uuid} ;;
    relationship: one_to_many
  }
}

explore: gene_test_orders {
  join: gene_test_orders_medical_codes {
    type: left_outer
    sql_on: ${gene_test_orders_medical_codes.gene_test_order_id} = ${gene_test_orders.id} ;;
    relationship: one_to_many
  }
}
