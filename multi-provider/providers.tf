data "aws_eks_cluster" "k8s_cluster_1" {
  name = var.cluster_names[0]
}

data "aws_eks_cluster_auth" "k8s_cluster_1_auth" {
  name = var.cluster_names[0]
}

data "aws_eks_cluster" "k8s_cluster_2" {
  name = var.cluster_names[1]
}

data "aws_eks_cluster_auth" "k8s_cluster_2_auth" {
  name = var.cluster_names[1]
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.k8s_cluster_1.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.k8s_cluster_1.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.k8s_cluster_1_auth.token
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.k8s_cluster_1.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.k8s_cluster_1.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.k8s_cluster_1_auth.token
  alias                  = "cluster-1"
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.k8s_cluster_2.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.k8s_cluster_2.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.k8s_cluster_2_auth.token
  alias                  = "cluster-2"
}
