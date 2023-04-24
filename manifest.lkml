project_name: "likitha"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
local_dependency: {
  project: "a_thelook"
}

constant: test{
  value: "
  {% if

  orders.count._in_query
  or order_items.count._in_query

  %}
  1=1
  {% else %}
  1=1
  {% endif %}"
}
