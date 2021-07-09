connection: "qa_analytics_db"

include: "/views/*.view.lkml"

explore: partners {
  join: partner_organizations {
    type: left_outer
    sql_on: ${partners.partner_organization_ids}::jsonb @> ${partner_organizations.id}::text::jsonb ;;
    relationship: one_to_many
  }
  join: referral_channels {
    type: left_outer
    sql_on: ${partners.referral_channel_id} = ${referral_channels.id} ;;
    relationship: one_to_one
  }
}

explore: gene_test_orders {
  join: gene_test_results {
    type: left_outer
    sql_on: ${gene_test_orders.order_uuid} = ${gene_test_results.order_uuid} ;;
    relationship: one_to_many
  }
  join: gene_test_orders_medical_codes {
    type: left_outer
    sql_on: ${gene_test_orders_medical_codes.gene_test_order_id} = ${gene_test_orders.id} ;;
    relationship: one_to_many
  }
  join: medical_codes {
    type: left_outer
    sql_on: ${gene_test_orders_medical_codes.medical_code_uuid} = ${medical_codes.uuid} ;;
    relationship: one_to_one
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

explore: providers {
  join: gmi_provider_details {
    type: left_outer
    sql_on: ${providers.uuid} = ${gmi_provider_details.provider_uuid} ;;
    relationship: one_to_many
  }
}

explore: completed_encounters {}


explore: referral_status {}


explore: clinical_operations {}
