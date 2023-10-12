# The name of this view in Looker is "Fct Orders"
view: fct_orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SALES"."FCT_ORDERS" ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}."AMOUNT" ;;
  }

  set: detail {
    fields: [order_id, order_date, amount, dim_products.product_name, dim_customers.company_name, dim_customers.contact_name]
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;  }

  measure: average_amount {
    label: "Average Sales Price"
    type: average
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [detail*]
    }

  dimension: customer_fk {
    type: string
    sql: ${TABLE}."CUSTOMER_FK" ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}."DISCOUNT" ;;
  }

  dimension: employee_fk {
    type: string
    sql: ${TABLE}."EMPLOYEE_FK" ;;
  }

  dimension: employee_id {
    type: number
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: freight {
    type: number
    sql: ${TABLE}."FREIGHT" ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_DATE" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
  }

  dimension: order_pk {
    type: string
    sql: ${TABLE}."ORDER_PK" ;;
    primary_key: yes
  }

  dimension: product_fk {
    type: string
    sql: ${TABLE}."PRODUCT_FK" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension_group: required {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."REQUIRED_DATE" ;;
  }

  dimension: ship_address {
    type: string
    sql: ${TABLE}."SHIP_ADDRESS" ;;
  }

  dimension: ship_city {
    type: string
    sql: ${TABLE}."SHIP_CITY" ;;
  }

  dimension: ship_country {
    type: string
    sql: ${TABLE}."SHIP_COUNTRY" ;;
  }

  dimension: ship_name {
    type: string
    sql: ${TABLE}."SHIP_NAME" ;;
  }

  dimension: ship_postal_code {
    type: string
    sql: ${TABLE}."SHIP_POSTAL_CODE" ;;
  }

  dimension: ship_region {
    type: string
    sql: ${TABLE}."SHIP_REGION" ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SHIPPED_DATE" ;;
  }

  dimension: shipper_fk {
    type: string
    sql: ${TABLE}."SHIPPER_FK" ;;
  }

  dimension: shipper_id {
    type: number
    sql: ${TABLE}."SHIPPER_ID" ;;
  }

  dimension: total_order_amount {
    type: number
    sql: ${TABLE}."TOTAL_ORDER_AMOUNT" ;;
  }

  dimension: total_order_quantity {
    type: number
    sql: ${TABLE}."TOTAL_ORDER_QUANTITY" ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}."UNIT_PRICE" ;;
  }
  measure: count {
    type: count
    drill_fields: [ship_name]
  }


}
