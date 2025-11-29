output "network_self_link" {
  value = google_compute_network.VPC_Network.self_link
}
output "subnetwork_self_link" {
  value = google_compute_subnetwork.VPC_Subnetwork.self_link
  
}