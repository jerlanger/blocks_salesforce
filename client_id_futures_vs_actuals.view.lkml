view: client_id_futures_vs_actuals {
  derived_table: {
    sql: SELECT client_id, event_month, SUM(weighted_future_budget) weighted_future_budget, SUM(advertiser_spend) advertiser_spend
      FROM
      (
      ( SELECT client_id, DATE_TRUNC('mon',event_date) event_month, SUM(weighted_future_budget) weighted_future_budget, SUM(0) advertiser_spend
        FROM
        ( SELECT NULLIF(acc.client_id__c,'')::DECIMAL(18,0)::INT client_id, oprod.opportunityid opportunity_id, oprod.id opportunity_product_id, dt.event_date, oprod.servicedate, oprod.flightend__c,
          SUM(oprod.estimated_budget__c)/(DATEDIFF('day',NULLIF(oprod.servicedate,'')::DATE,NULLIF(oprod.flightend__c,'')::DATE) + 1)::FLOAT weighted_future_budget
          FROM sfdc.opportunity_product oprod
          JOIN sfdc.opportunity opp
          ON oprod.opportunityid = opp.id
          JOIN sfdc.account acc
          ON opp.accountid = acc.id
          CROSS JOIN lk_date dt
          WHERE oprod.isdeleted = 'False'
          AND oprod.servicedate <= dt.event_date
          AND oprod.flightend__c >= dt.event_date
          AND dt.event_date >= CURRENT_DATE
          GROUP BY 1,2,3,4,5,6
          ORDER BY oprod.id, dt.event_date
                    )
        GROUP BY 1,2)
      UNION
      ( SELECT cli.client_id, DATE_TRUNC('mon',usli.event_date) event_month, SUM(0) weighted_future_budget, SUM(advertiser_spend) advertiser_spend
        FROM uslicer_exact_fact_new usli
        LEFT JOIN dsa.v_client_id_master cli
        ON usli.advertiser_id = cli.advertiser_id
        WHERE demand_type = 'default'
        GROUP BY 1,2
              )
      )
      GROUP BY 1,2
       ;;
      datagroup_trigger: new_date_refresh
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: event_month {
    type: time
    sql: ${TABLE}.event_month ;;
  }

  dimension: weighted_future_budget_hidden {
    type: number
    sql: ${TABLE}.weighted_future_budget ;;
    hidden: yes
  }

  dimension: advertiser_spend_hidden {
    type: number
    sql: ${TABLE}.advertiser_spend ;;
    hidden: yes
  }

  measure: weighted_future_budget {
    type: sum
    sql: ${weighted_future_budget_hidden} ;;
    description: "Weighted Salesforce budget for all dates after today"
  }

  measure: gross_revenue {
    type: sum
    sql: ${advertiser_spend_hidden} ;;
    description: "Previous exchange-only spend by client"
  }

  set: detail {
    fields: [client_id, event_month_time]
  }
}
