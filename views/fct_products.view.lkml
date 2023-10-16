# The name of this view in Looker is "Fct Products"
view: fct_products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SALES"."FCT_PRODUCTS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Latest Unit Price" in Explore.

  dimension: latest_unit_price {
    type: number
    sql: ${TABLE}."LATEST_UNIT_PRICE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_latest_unit_price {
    type: sum
    sql: ${latest_unit_price} ;;  }
  measure: average_latest_unit_price {
    type: average
    sql: ${latest_unit_price} ;;  }

  dimension: product_name {
    type: string
    sql: ${TABLE}."PRODUCT_NAME" ;;
  }

  dimension: max_unit_price {
    type: number
    sql: ${TABLE}."MAX_UNIT_PRICE" ;;
  }

  dimension: min_unit_price {
    type: number
    sql: ${TABLE}."MIN_UNIT_PRICE" ;;
  }

  dimension: avg_unit_price {
    type: number
    sql:  ${TABLE}."AVG_UNIT_PRICE" ;;
  }

  dimension: product_fk {
    type: string
    sql: ${TABLE}."PRODUCT_FK" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}."SUPPLIER_ID" ;;
  }

  dimension: supplier_fk {
    type: string
    sql: ${TABLE}."SUPPLIER_FK" ;;
  }

  dimension: suppliers_count {
    type: number
    sql: ${TABLE}."SUPPLIERS_COUNT" ;;
  }
  measure: count {
    type: count
  }
}
