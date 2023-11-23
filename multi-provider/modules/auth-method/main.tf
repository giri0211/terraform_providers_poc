 # gateway token reviewer service account
 resource "kubernetes_service_account_v1" "reviewer" {
   metadata {
     namespace = "default"
     name      = "service-account-test-1"
   }
 }


output "service_account_child_module" {
  value = kubernetes_service_account_v1.reviewer.metadata[0].name
}