variable "cluster_name" {
  description = "The name of the EKS cluster (for example eks-prod). This is used to namespace all the resources created by these templates."
  type        = string
  default = "tig-3730-fargate-logs"
}

variable "cluster_names" {
  description = "A list of cluster names"
  type        = list(string)
  default     = ["tig-3730-fargate-logs","csa-deployments"]
}
