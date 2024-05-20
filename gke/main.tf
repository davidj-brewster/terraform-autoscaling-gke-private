#todo add dedicated compute service account
resource "google_container_cluster" "primary" {
  name     = "private-gke-cluster-hybrid-premptible"
  location = var.region

  monitoring_service = "none" #for the brave.. but I will install vm

  network    = var.vpc_name
  #subnetwork = var.vpc_subnet
  deletion_protection = false

  remove_default_node_pool = false 

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
    initial_node_count = 0

    autoscaling {
      total_min_node_count = 1
      total_max_node_count = 1
    }

    node_config {
      machine_type = "g1-small" #up to 1vCPU, 1.7GB memory x1 non-preemptible, could also delete it
      disk_size_gb = 20
      disk_type = "pd-ssd"
      tags = [ "dedicated", "ssd" ]
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }
}

resource "google_container_node_pool" "pool-spot" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "preemptible-pool-small"
  initial_node_count = 1

  autoscaling {
    total_min_node_count = 2
    total_max_node_count = 4
  }
  
#  vertical_pod_autoscaling {
#    enabled = true
#  }

  node_config {
    spot = true
    machine_type = "g1-small"
    disk_size_gb = 15
    disk_type = "pd-ssd"
    tags = [ "spot", "pd-ssd" ]
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}


resource "google_container_node_pool" "pool-preempt" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "preemptible-pool-micro"
  initial_node_count = 1

  autoscaling {
    total_min_node_count = 1
    total_max_node_count = 4
  }

  node_config {
    preemptible  = true
    machine_type = "g1-small"
    disk_size_gb = 15
    tags = [ "preemptible", "pd-balanced" ]
    disk_type = "pd-balanced"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

resource "google_container_node_pool" "pool-spot-micro" {
  cluster    = google_container_cluster.primary.name
  location   = google_container_cluster.primary.location
  name       = "preemptible-pool-micro"
  initial_node_count = 1

  autoscaling {
    total_min_node_count = 1 
    total_max_node_count = 2 
  }

  node_config {
    spot = true
    machine_type = "f1-micro" #0.2 vCPU and 0.6 GB of RAM
    disk_size_gb = 10
    tags = [ "spot", "pd-ssd","f1-micro" ]
    disk_type = "pd-ssd"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}

