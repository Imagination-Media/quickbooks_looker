project_name: "imagination-media-looker"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
constant: yesterday {
  value: "date_add(current_date, interval -1 day)"
}
