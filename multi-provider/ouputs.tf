
output "cluster_name" {
  value = {
    cluster_name = var.cluster_names
    cluster_main_module = var.cluster_names[1]
    cluster_child_module = var.cluster_names[0]
  }
}

# output "providers" {
#   value = local.providers
# }