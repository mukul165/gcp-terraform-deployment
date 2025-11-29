resource "google_compute_network" "VPC_Network" {
  name                    = var.network_name
  auto_create_subnetworks = false
  
}
resource "google_compute_subnetwork" "VPC_Subnetwork" {
  name          = "${var.network_name}-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network = google_compute_network.VPC_Network.self_link
}
resource "google_compute_firewall" "allow-http" {
  name    = "${var.network_name}-allow-http"
  network = google_compute_network.VPC_Network.self_link

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web", "dev"]
  
}
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = google_compute_network.VPC_Network.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]

  # Must match tags on the VM
  target_tags = ["web", "dev"]
}
