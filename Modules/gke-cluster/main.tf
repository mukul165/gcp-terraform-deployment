resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.location

  network    = var.network
  subnetwork = var.subnetwork

  remove_default_node_pool = true
  initial_node_count       = 1

  # Enable private cluster
  private_cluster_config {
    enable_private_nodes    = false
    enable_private_endpoint = false  # Keep master endpoint public if you want access
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    
  }
  ip_allocation_policy {
  #use_ip_aliases                = true
  cluster_secondary_range_name  = var.cluster_secondary_range_name
  services_secondary_range_name = var.services_secondary_range_name
}


#   # Optional authorized networks for master
#   master_authorized_networks_config {
#     cidr_blocks = var.master_authorized_networks
#   }

  # Enable Kubernetes API server logging
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  deletion_protection = var.deletion_protection
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-nodepool"
  location   = var.location
  cluster    = google_container_cluster.this.name
  node_count = var.node_count

  node_config {
    machine_type = var.node_machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    # Private nodes have no public IP
    tags = ["private-node"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }
}
