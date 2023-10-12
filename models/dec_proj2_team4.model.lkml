# Define the database connection to be used for this model.
connection: "dec_snowflake"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: dec_proj2_team4_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
persist_with: dec_proj2_team4_default_datagroup

# include all the views
include: "/views/**/*.view"

explore: fct_orders {
#this is my explore name
  label: "Sales Explore"

#this is my order views name when seeing it on the left side bar in "explore" mode.
  view_label: "Orders"


  join: dim_customers {
    view_label: "Customer"
    sql_on: ${dim_customers.customers_key} = ${fct_orders.customer_fk};;
    type: left_outer
    relationship: many_to_one
  }
}
