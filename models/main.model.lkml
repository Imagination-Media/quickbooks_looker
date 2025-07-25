# Define the database connection to be used for this model.
connection: "imagination-media-looker"

# include all the views
include: "/views/**/*.view.lkml"
include: "/dashboards/**/*.dashboard.lookml"

#
# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: main_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: main_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Main"

explore: worklogs {
  # Repeated Nested Object
    join: worklogs__attributes__values {
      view_label: "Worklogs: Attributes Values"
      sql: LEFT JOIN UNNEST(${worklogs.attributes__values}) as worklogs__attributes__values ;;
      relationship: one_to_many
    }
    join: jira_users {
      type: left_outer
      relationship: many_to_one
      sql_on: ${worklogs.author__account_id}=${jira_users.id} ;;
    }
    join: users {
      type: left_outer
      relationship: many_to_one
      sql_on: ${worklogs.author__account_id}=${users.jira_user} ;;

    }
    join: staff_capacity {
      type: left_outer
      relationship:one_to_many
      sql_on:   ${worklogs.author__account_id}=${staff_capacity.jira_user_id}
                and  ${worklogs.start_date_raw}=${staff_capacity.capacity_period_raw};;
    }

   }

 explore: jira_users_only {
  from: jira_users
    }
  explore: users {
    }

  explore: jira_users {
      # Repeated Nested Object

      join: worklogs {
        type: left_outer
        relationship: one_to_many
        sql_on: ${worklogs.author__account_id}=${jira_users.id} ;;

      }
    join: worklogs__attributes__values {
      view_label: "Worklogs: Attributes Values"
      sql: LEFT JOIN UNNEST(${worklogs.attributes__values}) as worklogs__attributes__values ;;
      relationship: one_to_many
    }
      join: users {
        type: left_outer
        relationship: many_to_one
        sql_on: ${users.jira_user}=${jira_users.id} ;;

      }
    }

    explore: utilization{
      from: staff_capacity
      join: worklog_monthly_hrs_by_jira_user {
        type: left_outer
        relationship: one_to_one
        sql_on:  ${worklog_monthly_hrs_by_jira_user.author__account_id}=${utilization.jira_user_id}
                and  ${worklog_monthly_hrs_by_jira_user.created_month}=${utilization.capacity_period_month};;
      }

    }

explore: utilization_2{
  from: staff_capacity
  join: worklogs_billable_nonbillable_agg {
    type: left_outer
    relationship: one_to_one
    sql_on:  ${worklogs_billable_nonbillable_agg.jira_user_id}=${utilization_2.jira_user_id}
      and  DATE(${worklogs_billable_nonbillable_agg.created_raw})=${utilization_2.capacity_period_raw};;
  }
  join: staff_cost {
    type: left_outer
    relationship: one_to_one
    sql_on:  ${staff_cost.jira_user_id}=${utilization_2.jira_user_id}
      and  DATE(${staff_cost.cost_period_raw})=${utilization_2.capacity_period_raw};;
  }
}

explore: validate_worklog_agg {
  from: worklogs_billable_nonbillable_agg
}

explore: worklog_monthly_hrs_by_jira_user {}

explore: staff_capacity {}

# explore: staff_capacity_detail {}

explore: team_utilization{
  from: staff_capacity_detail
  join: staff_capacity {
    type: left_outer
    relationship: many_to_one
    sql_on: ${team_utilization.jira_user_id}=${staff_capacity.jira_user_id}
    and  ${team_utilization.capacity_period_raw}=${staff_capacity.capacity_period_raw};;
    }
  join: worklogs_billable_nonbillable_agg {
    type: left_outer
    relationship: many_to_one
    sql_on: ${team_utilization.jira_user_id}=${worklogs_billable_nonbillable_agg.jira_user_id}
    and  DATE(${worklogs_billable_nonbillable_agg.created_raw})=${team_utilization.capacity_period_raw};;
  }
}

explore: staff_cost {}

####################################################
#
#  Quickbooks
#
###################################################


explore: quickbooks__ap_ar_enhanced {
}

explore: quickbooks__balance_sheet {
}


explore: quickbooks__cash_flow_statement {
}

explore: quickbooks__expenses_sales_enhanced {
}


explore: quickbooks__general_ledger {
}

explore: quickbooks__general_ledger_by_period {
}

explore: quickbooks__profit_and_loss {
}


  # Non Repeated Nested Object
  # join: worklogs__attributes__values {
  #   view_label: "Worklogs: Attributes Values"
  #   sql: LEFT JOIN UNNEST(${worklogs.attributes__values}) as worklogs__attributes__values ;;
  #   relationship: one_to_many
  # }
###################################################
###################################################
###################################################
###################################################
# Profitability
#
# - Requires joins from quickbook invoice thru to jira project_key
#   - Combined with hours worked from tempo.worklogs joined thru to jira project_key
# - will probably need symmetric aggregation to address fanout
#
explore: invoice {
  join: project {
    #view_label: "jira project"
    type: left_outer
    relationship: many_to_one
    sql_on: ${invoice.custom_jira_project_key}=${project.project_key}  ;;
  }
  join: project_board {
    type: left_outer
    relationship: one_to_many
    sql_on: ${project.id}=${project_board.project_id} ;;
  }
  join: issue_board_im {
    type: left_outer
    relationship: one_to_many
    sql_on: ${project_board.board_id}=${issue_board_im.board_id} ;;
  }
  join: worklogs_by_issue{
    type: left_outer
    relationship: one_to_many
    sql_on: ${issue_board_im.issue_id}=${worklogs_by_issue.issue_id} ;;
  }
  join: customer {
      type: left_outer
      relationship: many_to_one
      sql_on: ${customer.id}=${invoice.customer_id} ;;
  }
  }

  # explore: utilization_2{
  #   from: staff_capacity
  #   join: worklogs_billable_nonbillable_agg {
  #     type: left_outer
  #     relationship: one_to_one
  #     sql_on:  ${worklogs_billable_nonbillable_agg.jira_user_id}=${utilization_2.jira_user_id}
  #       and  DATE(${worklogs_billable_nonbillable_agg.created_raw})=${utilization_2.capacity_period_raw};;
  #   }
  #   join: staff_cost {
  #     type: left_outer
  #     relationship: one_to_one
  #     sql_on:  ${staff_cost.jira_user_id}=${utilization_2.jira_user_id}
  #       and  DATE(${staff_cost.cost_period_raw})=${utilization_2.capacity_period_raw};;
  #   }
  # }

####################################################
#
#  Rogers Sales, Item, Store, Customer, and Customer Addressess
#
###################################################

explore:  viewtruecommerceedi{  # Not using, view based on purchase order info
  hidden: yes
  }


explore: rogers_known_customer_sales {        ## i.e. sales for customers with address - would prefer not to
                                              ## do this - i.e. constrain on inner join, as want to compare
                                              ## total sales to known_customer_sales, maybe this is achieved
                                              ## with customer_address.active filter?
  from: sales
  join: stores {
    type: inner
  relationship: many_to_one
  sql_on: ${rogers_known_customer_sales.store_id}=${stores.store_id};;
}
join: item {
  relationship: many_to_one
  sql_on: ${rogers_known_customer_sales.item_id}=${item.item_id};;
}
join: customers {
  type: inner
  relationship: many_to_one
  sql_on:  ${rogers_known_customer_sales.customer_id}=${customers.customer_id};;
}
join: customer_address {
  type: inner
  relationship: one_to_one
  sql_on: ${customers.customer_id}=
  safe_cast(
 (safe_cast(${customer_address.store_id} as string) ||safe_cast(${customer_address.customer_id} as string)) as INT)  ;;

  ##sql_on: ${customers.customer_id}=safe_cast((${customer_address.store_id} ||${customer_address.customer_id}) as INT)  ;;
}

}

  explore: rogers_sales {
    from: sales
    join: stores {
      relationship: many_to_one
      sql_on: ${rogers_sales.store_id}=${stores.store_id};;
    }
    join: item {
      relationship: many_to_one
      sql_on: ${rogers_sales.item_id}=${item.item_id};;
    }
    join: customers {
      relationship: many_to_one
      sql_on:  ${rogers_sales.customer_id}=${customers.customer_id};;
    }
    join: customer_address {
      relationship: one_to_one
      sql_on: ${customers.customer_id}=
          safe_cast(
         (safe_cast(${customer_address.store_id} as string) ||safe_cast(${customer_address.customer_id} as string)) as INT)  ;;

      ##sql_on: ${customers.customer_id}=safe_cast((${customer_address.store_id} ||${customer_address.customer_id}) as INT)  ;;


    }

  }

