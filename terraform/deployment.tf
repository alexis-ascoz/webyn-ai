resource "kubernetes_deployment_v1" "app" {
  metadata {
    name = "api-deployment"
    labels = {
      app = "api"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "api"
      }
    }

    template {
      metadata {
        labels = {
          app = "api"
        }
      }

      spec {
        container {
          name  = "api-container"
          image = "ascoz/hello-world:latest"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}
