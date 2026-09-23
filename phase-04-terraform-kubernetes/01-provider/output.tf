output "deployment_name" {
  value = kubernetes_deployment.nginx.metadata[0].name
}

output "service_cluster_ip" {
  value = kubernetes_service.nginx.spec[0].cluster_ip
}

