connection: "analytics_db"

include: "/views/*.view.lkml"

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
