view: high_priority_patients {

  derived_table: {
    sql: SELECT DISTINCT
          p.uuid::TEXT AS high_prio_patient_uuid
        FROM
          audit_trail at
          JOIN patient_encounter_summary p ON at.data ->> 'object_uuid' = p.patient_uuid::text
        WHERE
          at.data ->> 'object' = 'Patients'
          AND at.data ->> 'service_type' = 'edit'
          AND at.data -> 'changes' -> 'high_priority' ->> 'new_value' = 'true'
          AND at.data -> 'changes' -> 'high_priority' ->> 'old_value' = 'false'
      ;;
  }

  dimension: high_prio_patient_uuid {
    type: string
    primary_key: yes
    sql: ${TABLE}.high_prio_patient_uuid ;;
  }

  dimension: is_high_priority {
    type: yesno
    sql: ${TABLE}.high_prio_patient_uuid == ${patient_encounter_summary.patient_uuid} ;;
  }

  measure: count {
    type: count
  }
}
