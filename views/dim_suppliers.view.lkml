# The name of this view in Looker is "Dim Suppliers"
view: dim_suppliers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SALES"."DIM_SUPPLIERS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Address" in Explore.

  dimension: address {
    type: string
    sql: ${TABLE}."ADDRESS" ;;
  }

  dimension: city_name {
    type: string
    sql: ${TABLE}."CITY_NAME" ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}."COMPANY_NAME" ;;
  }

  dimension: contact_name {
    type: string
    sql: ${TABLE}."CONTACT_NAME" ;;
  }

  dimension: contact_title {
    type: string
    sql: ${TABLE}."CONTACT_TITLE" ;;
  }

  dimension: country_name {
    type: string
    sql: ${TABLE}."COUNTRY_NAME" ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}."POSTAL_CODE" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}."SUPPLIER_ID" ;;
  }

  dimension: supplier_fk {
    type: string
    sql: ${TABLE}."SUPPLIER_FK" ;;
  }
  measure: count {
    type: count
    drill_fields: [contact_name, country_name, city_name, company_name]
  }
}
