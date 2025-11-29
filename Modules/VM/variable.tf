variable "instance_name" {
  description = "Name of the VM instance"
  type        = string
}

variable "machine_type" {
  description = "Machine type of the VM instance"
  type        = string
}

variable "zone" {
  description = "Zone where the VM instance will be created"
  type        = string
}

variable "disk_image" {
  description = "Disk image for the VM instance"
  type        = string
}

variable "network" {
  description = "Network self-link"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork self-link"
  type        = string
}

variable "instance_tags" {
  description = "Tags for the VM instance"
  type        = list(string)
}
