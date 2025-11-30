module "VPC" {
  source       = "./Modules/network"
  network_name = "terraform-network"
  
}
module "Compute-Engine" {
  source         = "./Modules/VM"
  instance_name  = "terraform-vm-instance"
  machine_type   = "e2-medium"
  zone           = "us-central1-a"
  disk_image     = "debian-cloud/debian-12"
  network        = module.VPC.network_self_link
  subnetwork     = module.VPC.subnetwork_self_link
  instance_tags  = ["web", "dev"]
  
}
module "gke_private_cluster" {
  source           = "./Modules/gke-cluster"
  cluster_name     = "my-private-cluster"
  location         = "us-central1"
  node_count       = 3
  node_machine_type = "e2-medium"
  network          = module.VPC.network_self_link
  subnetwork       = module.VPC.subnetwork_self_link
  master_ipv4_cidr_block = "10.0.0.0/28"
  deletion_protection = false
}

