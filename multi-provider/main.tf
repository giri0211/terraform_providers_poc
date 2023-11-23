module "auth_method_cluster_1" {
  count        = length(var.cluster_names) > 0 ? 1 : 0
  source       = "./modules/auth-method"
  cluster_name = var.cluster_names[0]
  providers = {
    kubernetes = kubernetes.cluster-1
  }
}

module "auth_method_cluster_2" {
  count        = length(var.cluster_names) > 1 ? 1 : 0
  source       = "./modules/auth-method"
  cluster_name = var.cluster_names[1]
  providers = {
    kubernetes = kubernetes.cluster-2
  }
}

# this dynamic way of setting providers also not possible

locals {
  providers = { for idx, name in var.cluster_names : idx => { provider = "kubernetes.cluster-${idx + 1}", cluster_name = name } }
  alias     = { for idx, name in var.cluster_names : idx => "kubernetes.cluster-${idx + 1}" }
}

# module "auth_method_clusters" {
#   #  for_each = { for idx, name in var.cluster_names : idx => {provider ="kubernetes.cluster-${idx + 1}", cluster_name = name } }
#   for_each = { for idx, name in var.cluster_names : idx => { idx = idx, provider = "kubernetes.cluster-${idx + 1}", cluster_name = name } }

#   source       = "./modules/auth-method"
#   cluster_name = each.value.cluster_name
#   providers = {
#     kubernetes = local.alias[each.value.idx]
#   }
# }






