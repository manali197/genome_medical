connection: "analytics_db"

include: "/views/*.view.lkml"
include: "customer_success_v2.dashboard"

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

explore: referral_status {
  persist_for: "5 minutes"
  join: top_test {
    type: left_outer
    relationship: many_to_one
    sql_on: ${referral_status.test_name} = ${top_test.test_name}  ;;
  }
  join: top_labs {
    type: left_outer
    relationship: many_to_one
    sql_on:  ${referral_status.testing_lab} = ${top_labs.lab_name} ;;
  }
  join: completed_encounters {
    type: left_outer
    relationship: one_to_one
    sql_on: ${referral_status.encounter_uuid} = ${completed_encounters.encounter_uuid} ;;
  }
  join: gene_test_orders {
    type: left_outer
    sql_on: ${referral_status.encounter_uuid} = ${gene_test_orders.encounter_uuid} ;;
    relationship: one_to_many
  }
  join: patient_communication_details {
    type: left_outer
    sql_on: ${referral_status.patient_uuid} = ${patient_communication_details.patient_uuid} ;;
    relationship: one_to_many
  }
}

explore: tickets {
  join: patient_encounter_summary {
    type: left_outer
    relationship: many_to_one
    sql_on: ${patient_encounter_summary.patient_uuid} = ANY(${tickets.ticket_patient_uuids});;
  }
  join: users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${users.id} = ANY(${tickets.ticket_user_ids});;
  }
}

explore: documents {
  join: document_activity {
    type: left_outer
    sql_on: ${documents.id} = ${document_activity.document_id} ;;
    relationship: one_to_many
  }
  join: document_owners {
    type: left_outer
    sql_on: ${documents.id} = ${document_owners.document_id} ;;
    relationship: one_to_many
  }
  join: patient_encounter_summary {
    type: left_outer
    sql_on: ${document_owners.document_owner_type_name} = 'patient' AND ${document_owners.document_owner_id} = ${patient_encounter_summary.patient_uuid};;
    relationship: many_to_one
  }
  join: gene_test_orders {
    type: left_outer
    sql_on: ${document_owners.document_owner_type_name} = 'gene_test_order' AND ${document_owners.document_owner_id} = ${gene_test_orders.order_uuid};;
    relationship: many_to_one
  }
}
