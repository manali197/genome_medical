connection: "qa_analytics_db"

include: "/views/*.view.lkml"
include: "business_operations_v2_qa.dashboard"
include: "referral_status_v2_qa.dashboard"

# explore: patient_encounter_summary {
#   join: encounter_details {
#     type: left_outer
#     sql_on: ${patient_encounter_summary.patient_uuid} = ${encounter_details.user_uuid} ;;
#     relationship: one_to_many
#   }
# }

explore: encounter_details {
  access_filter: {
    field: patient_encounter_summary.referral_program
    user_attribute: referral_program
  }
  join: patient_encounter_summary {
    type: left_outer
    sql_on: ${patient_encounter_summary.patient_uuid} = ${encounter_details.user_uuid} ;;
    relationship: many_to_one
  }
  join: gene_test_orders {
    type: left_outer
    sql_on: ${encounter_details.encounter_uuid} = ${gene_test_orders.encounter_uuid} ;;
    relationship: many_to_one
  }
  join: gene_test_results {
    type: left_outer
    sql_on: ${gene_test_orders.order_uuid} = ${gene_test_results.order_uuid} ;;
    relationship: many_to_one
  }
  join: partners {
    type: left_outer
    sql_on: ${patient_encounter_summary.partner_id} = ${partners.id} ;;
    relationship: many_to_one
  }
  join: referral_channels {
    type: left_outer
    sql_on: ${partners.referral_channel_id} = ${referral_channels.id} ;;
    relationship: many_to_one
  }
  join: high_priority_patients {
    type: left_outer
    sql_on: ${patient_encounter_summary.patient_uuid} = ${high_priority_patients.high_prio_patient_uuid} ;;
    relationship: one_to_one
    }
  join: top_referral_programs {
    type: left_outer
    sql_on: ${patient_encounter_summary.referral_program} = ${top_referral_programs.referral_program} ;;
    relationship: many_to_one
  }
}

explore: gene_test_orders {
  join: gene_test_results {
    type: left_outer
    sql_on: ${gene_test_orders.order_uuid} = ${gene_test_results.order_uuid} ;;
    relationship: many_to_one
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

explore: email_events {
  join: patient_encounter_summary {
    type: left_outer
    sql_on: ${email_events.recipient_type_name} = 'patient' AND ${email_events.recipient_uuid} = ${patient_encounter_summary.patient_uuid} ;;
    relationship: many_to_one
  }
}

explore: completed_encounters {

}

explore: clinical_operations {

}

explore: tickets {

}

explore: referral_status {
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
