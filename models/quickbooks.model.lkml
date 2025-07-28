# Define the database connection to be used for this model.
connection: "im-datalake"

# include all the views
include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"
include: "/data_tests/*.view.lkml"


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

explore: primary_key_validation {
  label: "Data Quality - Primary Key Validation"
  description: "Validate primary key uniqueness across Quickbooks tables"
}

explore: referential_integrity_validation {
  label: "Data Quality - Referential Integrity"
  description: "Validate foreign key relationships in Quickbooks data"
}

explore: data_consistency_validation {
  label: "Data Quality - Data Consistency"
  description: "Validate business rules and data consistency in Quickbooks data"
}

explore: quickbooks__profit_and_loss {
}



explore: invoice {}

  # join: customer {
  #     type: left_outer
  #     relationship: many_to_one
  #     sql_on: ${customer.id}=${invoice.customer_id} ;;
  # }


explore: customer {}



