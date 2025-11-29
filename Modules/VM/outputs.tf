output "nginx-ip" {
 description = "public_vm_ip"
 value       = google_compute_instance.VM_Instance.network_interface[0].access_config[0].nat_ip 
}