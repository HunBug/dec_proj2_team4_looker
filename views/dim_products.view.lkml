# The name of this view in Looker is "Dim Products"
view: dim_products {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SALES"."DIM_PRODUCTS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Discontinued" in Explore.

  dimension: discontinued {
    type: number
    sql: ${TABLE}."DISCONTINUED" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}."PRODUCT_NAME" ;;
  }

  dimension: products_key {
    type: string
    sql: ${TABLE}."PRODUCTS_KEY" ;;
    primary_key: yes
  }

  dimension: quantity_per_unit {
    type: string
    sql: ${TABLE}."QUANTITY_PER_UNIT" ;;
  }

  dimension: reorder_level {
    type: number
    sql: ${TABLE}."REORDER_LEVEL" ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}."UNIT_PRICE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_unit_price {
    type: sum
    sql: ${unit_price} ;;  }
  measure: average_unit_price {
    type: average
    sql: ${unit_price} ;;  }

  dimension: units_in_stock {
    type: number
    sql: ${TABLE}."UNITS_IN_STOCK" ;;
  }

  dimension: units_on_order {
    type: number
    sql: ${TABLE}."UNITS_ON_ORDER" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: valid_from {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."VALID_FROM" ;;
  }

  dimension_group: valid_to {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."VALID_TO" ;;
  }
  measure: count {
    type: count
    drill_fields: [product_name]
  }
}
