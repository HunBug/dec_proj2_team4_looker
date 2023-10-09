# Define the database connection to be used for this model.
connection: "dec_snowflake"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: dec_proj2_team4_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: dec_proj2_team4_default_datagroup

