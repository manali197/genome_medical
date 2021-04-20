view: top_labs {
  derived_table: {
    sql: SELECT testing_lab, RANK() OVER
                  (order by count(*) DESC) lab_rank
                FROM ${referral_status.SQL_TABLE_NAME} where testing_lab is not null group by 1 ;;
  }
  dimension: lab_name {
    type: string
    sql: ${TABLE}.testing_lab ;;
    hidden: yes
  }

  dimension: lab_rank {
    type: number
    sql: ${TABLE}.lab_rank ;;
    #hidden: yes
  }

  dimension: top_10_lab {
    type: yesno
    sql: ${lab_rank} < 11 ;;
    hidden: yes
  }

  dimension: top_10_labs_name {
    type: string
    sql: CASE WHEN ${top_10_lab} = 'Yes' then ${lab_name} else 'Other' end ;;
  }
  }
