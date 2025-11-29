terraform {
  backend "gcs" {
    bucket = "terraform-state-cts13"
    prefix = "network/terraform.state"
  }
}