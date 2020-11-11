# If necessary, uncomment the line below to include explore_source.
# include: "genome.model.lkml"

view: top_referral_programs {
  derived_table: {
    explore_source: encounter_details {
      bind_filters: {
        from_field: encounter_details.date_of_service_date
        to_field: encounter_details.date_of_service_date
      }
      column: count_not_null_encounters {}
      column: referral_program { field: patient_encounter_summary.referral_program }
      filters: {
        field: encounter_details.is_completed_encounter
        value: "Yes"
      }
      limit: 10
    }
  }
  dimension: count_not_null_encounters {
    hidden: yes
    label: "Encounter Details Encounters"
    type: number
  }
  dimension: referral_program {
    hidden: yes
  }
}
