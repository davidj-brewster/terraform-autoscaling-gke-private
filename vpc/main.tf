# module.vpc.google_compute_network.network:
resource "google_compute_network" "network" {
    auto_create_subnetworks = false
    delete_default_routes_on_create = false
    enable_ula_internal_ipv6 = false
    name = var.vpc_name
    project = var.project_id
    routing_mode = "GLOBAL"
}   

resource "google_compute_subnetwork" "public_subnet" {
  name = "vpc-subnet-public"
  ip_cidr_range = "10.0.3.0/24"
  region = var.region
  network = var.vpc_name
  private_ip_google_access = false
}

resource "google_compute_subnetwork" "private_subnet_gke" {
  name = var.vpc_subnet
  ip_cidr_range = "10.10.0.0/16"
  region = var.region
  network = var.vpc_name
  private_ip_google_access = true
}



