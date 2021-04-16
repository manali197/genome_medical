view: top_test {
derived_table: {
sql: with tests as(SELECT test_name, RANK() OVER
                    (order by count(*) DESC) test_rank
                    FROM ${referral_status.SQL_TABLE_NAME} group by 1),
    with labs as(SELECT testing_lab, RANK() OVER
                  (order by count(*) DESC) lab_rank
                  FROM ${referral_status.SQL_TABLE_NAME} group by 1)
    SELECT test_name,test_rank,testing_lab,lab_rank from tests, labs ;;
}

dimension: test_name {
  type: string
  sql: ${TABLE}.test_name ;;
  hidden: yes
}

dimension: lab_name {
  type: string
  sql: ${TABLE}.testing_lab ;;
  hidden: yes
}

dimension: test_rank {
  type: number
  sql: ${TABLE}.test_rank ;;
  hidden: yes
}

  dimension: lab_rank {
    type: number
    sql: ${TABLE}.lab_rank ;;
    hidden: yes
  }

 dimension: top_10_tests {
  type: yesno
  sql: ${test_rank} < 11 ;;
  hidden: yes
  }

  dimension: top_10_lab {
    type: yesno
    sql: ${lab_rank} < 11 ;;
    hidden: yes
  }

  dimension: top_10_test_name {
    type: string
  sql: CASE WHEN ${top_10_tests} = 'Yes' then ${test_name} else 'Other' end ;;
  }

  dimension: top_10_labs_name {
    type: string
    sql: CASE WHEN ${top_10_lab} = 'Yes' then ${lab_name} else 'Other' end ;;
  }

}
