include:"/views/orders.view.lkml"
include: "/views/users.view.lkml"
include: "/views/order_items.view.lkml"

explore:Testing {
  from: users
  label: "Testing"
  description: "Don't change this"

  join: orders{
    sql_on: ${orders.id} = ${Testing.id} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: order_items{
    sql_on: ${order_items.id} = ${Testing.id} ;;
    relationship: many_to_one
    type: left_outer
  }

  sql_always_where:
  {% if orders.day_interval._parameter_value != "NULL" %}
  MOD(DATEDIFF(day, COALESCE({% date_start date.date_date %}, {% date_end date.date_date %}, '1970-01-01'::DATE), date.date_date), {% parameter date.day_interval %}) = 0
  {% else %}
  1=1
  {% endif %};;

}
