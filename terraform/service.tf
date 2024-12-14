
resource "kubernetes_service_v1" "app" {
  metadata {
    name = "api-service"
  }

  spec {
    selector = {
      app = "api"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
