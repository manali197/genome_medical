view: top_test {
  derived_table: {
    # SELECT test_name, RANK() OVER (order by count(*) DESC) test_rank
    # FROM ${referral_status.SQL_TABLE_NAME} where test_name is not null group by 1
    sql: SELECT gto.gene_test_display_name AS test_name,
        RANK() OVER (order by count(*) DESC) AS test_rank
      FROM gene_test_orders gto
      GROUP BY 1
    ;;
  }

  dimension: test_name {
    type: string
    sql: ${TABLE}.test_name ;;
    hidden: yes
  }

  dimension: test_rank {
    type: number
    sql: ${TABLE}.test_rank ;;
    #hidden: yes
  }

 dimension: top_10_tests {
  type: yesno
  sql: ${test_rank} < 11 ;;
  hidden: yes
  }

  dimension: top_10_test_name {
    type: string
  sql: CASE WHEN ${top_10_tests} = 'Yes' then ${test_name} else 'Other' end ;;
  }

}
