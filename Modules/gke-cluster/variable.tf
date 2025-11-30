variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "location" {
  type        = string
  description = "GCP region or zone"
}

variable "node_count" {
  type        = number
  default     = 3
  description = "Number of nodes in the node pool"
}

variable "min_node_count" {
  type    = number
  default = 1
}

variable "max_node_count" {
  type    = number
  default = 5
}

variable "node_machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Machine type for the nodes"
}

variable "network" {
  description = "Network self-link"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork self-link"
  type        = string
}

variable "master_authorized_networks" {
  type        = list(object({ cidr_block = string, display_name = string }))
  default     = []
  description = "List of authorized networks for Kubernetes master"
}

variable "master_ipv4_cidr_block" {
  type        = string
  default     = "10.0.0.0/28"
  description = "CIDR block for private master endpoint"
}
variable "deletion_protection" {
  type        = bool
  default     = false
  description = "Enable deletion protection for the node pool"
  
}