output "cluster_name" {
  value = google_container_cluster.this.name
}

output "endpoint" {
  value = google_container_cluster.this.endpoint
}

output "private_cluster" {
  value = google_container_cluster.this.private_cluster_config[0].enable_private_nodes
}

output "node_pool_name" {
  value = google_container_node_pool.primary_nodes.name
}
