# view: pop_parameters {
#   extends: [encounter_details]
#   filter: current_date_range {
#     type: date
#     view_label: "_PoP"
#     label: "1. Current Date Range"
#     description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
#     sql: ${period} IS NOT NULL ;;
#   }

#   parameter: compare_to {
#     view_label: "_PoP"
#     description: "Select the templated previous period you would like to compare to. Must be used with Current Date Range filter"
#     label: "2. Compare To:"
#     type: unquoted
#     allowed_value: {
#       label: "Previous Period"
#       value: "Period"
#     }
#     allowed_value: {
#       label: "Previous Week"
#       value: "Week"
#     }
#     allowed_value: {
#       label: "Previous Month"
#       value: "Month"
#     }
#     allowed_value: {
#       label: "Previous Quarter"
#       value: "Quarter"
#     }
#     allowed_value: {
#       label: "Previous Year"
#       value: "Year"
#     }
#     default_value: "Period"
#     # view_label: "_PoP"
#   }
# }
