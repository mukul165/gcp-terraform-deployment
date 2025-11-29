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