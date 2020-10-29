connection: "qa_analytics_db"

include: "/views/*.view.lkml"

explore: patient_encounter_summary {
  join: encounter_details {
    type: left_outer
    sql_on: ${patient_encounter_summary.patient_uuid} = ${encounter_details.user_uuid} ;;
    relationship: one_to_many
  }
}
