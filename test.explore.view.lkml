include: "/views/orders.view.lkml"
include: "/views/users.view.lkml"


explore: testing{
  label: "Repro"
  from: orders
  sql_always_where:
  {% if day_interval._parameter_value != "NULL" %}
  MOD(DATEDIFF(day, COALESCE({% date_start date.date_date %}, {% date_end date.date_date %}, '2020-01-01'::DATE), date.date_date), {% parameter date.day_interval %}) = 0
  {% else %}
  1=1
  {% endif %}
  AND @{test};;
}
