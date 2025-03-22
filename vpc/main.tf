# module.vpc.google_compute_network.network:
resource "google_compute_network" "network" {
  auto_create_subnetworks         = true
  delete_default_routes_on_create = false
  enable_ula_internal_ipv6        = false
  name                            = var.vpc_name
  project                         = var.project_id
  routing_mode                    = "GLOBAL"
}


