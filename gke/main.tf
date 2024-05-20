#todo add dedicated compute service account
resource "google_container_cluster" "primary" {
  name     = "private-gke-cluster-hybrid-premptible"
  location = var.region

  network    = var.vpc_name
  subnetwork = var.vpc_subnet

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  master_authorized_networks_config {
    cidr_blocks {
        cidr_block = "10.0.0.0/8"
        display_name = "vpc-access" 
    }
  }
  

  node_pool {
    name       = "default-node-pool"
    initial_node_count = 1

    autoscaling {
      min_node_count = 1
      max_node_count = 2
    }

    node_config {
      machine_type = "g1-small" #up to 1vCPU, 1.7GB memory x1 non-preemptible, could also delete it
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }
}

resource "google_container_node_pool" "preemptible_pool-sm" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "preemptible-pool-small"
  initial_node_count = 1

  autoscaling {
    min_node_count = 1 
    max_node_count = 3
  }

  node_config {
    preemptible  = true
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}


resource "google_container_node_pool" "preemptible_pool-tn" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "preemptible-pool-micro"
  initial_node_count = 2

  autoscaling {
    min_node_count = 1 
    max_node_count = 6
  }

  node_config {
    preemptible  = true
    machine_type = "f1-micro" #0.2 vCPU and 0.6 GB of RAM
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

