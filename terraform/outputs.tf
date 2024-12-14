output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "application_endpoint" {
  value       = kubernetes_service_v1.app.status.0.load_balancer.0.ingress.0.ip
  description = "Application Endpoint"
}
