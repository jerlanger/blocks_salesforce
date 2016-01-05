- view: account
  extends: _account
  fields:
  
# dimensions #

  - dimension: business_segment
    type: string
    sql_case:
      'Small Business': ${number_of_employees} BETWEEN 0 AND 500
      'Mid-Market': ${number_of_employees} BETWEEN 501 AND 1000
      'Enterprise': ${number_of_employees} > 1000
      else: 'Unknown'    

# measures #

  - measure: percent_of_accounts
    type: percent_of_total
    sql: ${count}
    
  - measure: average_annual_revenue
    type: average
    sql: ${annual_revenue}
    value_format: '$#,##0'
    
  - measure: total_number_of_employees
    type: sum
    sql: ${number_of_employees}
    
  - measure: average_number_of_employees
    type: avg
    sql: ${number_of_employees}
    
  - measure: count_customers
    type: count
    filters:
      account.type: '"Customer"'
    
    
- view: lead
  extends: _lead
  
  
- view: opportunity
  extends: _opportunity
  fields:
  
# dimensions #

  - dimension: days_open
    type: number
    sql: datediff(days, ${created_date}, coalesce(${close_date}, current_date) ) 
    
  - dimension:  created_to_closed_in_60 
    hidden: true
    type: yesno
    sql: ${days_open} <=60 AND ${is_closed} = 'yes' AND ${is_won} = 'yes'     
  
  # measures #
  
  - measure: total_revenue
    type: sum
    sql: ${amount}
    value_format: '$#,##0'
    
  - measure: average_deal_style
    type: avg
    sql: ${amount}
    value_format: '$#,##0'
  
  - measure: count_won
    type: count
    filters:
      is_won: Yes
    drill_fields: [opportunity.id, account.name, type]
    
  - measure: average_days_open
    type: avg
    sql: ${days_open}
    
  - measure: count_closed
    type: count
    filters: 
      is_closed: Yes
      
  - measure: count_open
    type: count
    filters:
      is_closed: No
    
  - measure: count_lost
    type: count
    filters:
      is_closed: Yes
      is_won: No
    drill_fields: [opportunity.id, account.name, type] 

  - measure: win_percentage
    type: number
    sql: 100.00 * ${count_won} / NULLIF(${count}, 0)
    value_format: '#0.00\%'
    
  - measure: open_percentage
    type: number
    sql: 100.00 * ${count_open} / NULLIF(${count}, 0)
    value_format: '#0.00\%' 
    
  - measure: count_new_business_won
    type: count
    filters:
      is_won: Yes
      opportunity.type: '"New Business"'
    drill_fields: [opportunity.id, account.name, type]    
    
  - measure: count_new_business
    type: count
    filters:
      opportunity.type: '"New Business"'
    drill_fields: [opportunity.id, account.name, type]   
  
  
- view: campaign
  extends: _campaign
  
  
- view: user
  extends: _user
  fields:
  
# dimensions #

  - filter: user_select
    suggest_dimension: name
      
  - filter: department_select
    suggest_dimension: department    
      
  - dimension: rep_comparitor
    sql: |
          CASE 
            WHEN {% condition user_select %} ${name} {% endcondition %}
              THEN '1 - ' || ${name}
            WHEN {% condition department_select %} ${department} {% endcondition %}          
              THEN '2 - Rest of ' || ${department}
          ELSE '3 - Rest of Sales Team'
          END

  
- view: contact
  extends: _contact