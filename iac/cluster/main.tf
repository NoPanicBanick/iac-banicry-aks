locals {
  location  = "SFO3"
  base_name = "banicry"
}

resource "digitalocean_kubernetes_cluster" "foo" {
  name    = "${local.base_name}-aks"
  region  = local.location
  version = "1.25.4-do.0"

  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-4gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 2
  }
}