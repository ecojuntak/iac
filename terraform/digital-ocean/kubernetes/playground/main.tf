resource "digitalocean_kubernetes_cluster" "this" {
  name   = "playground"
  region = "sgp1"

  version = "1.29.1-do.0"

  node_pool {
    name       = "worker-pool-01"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}
