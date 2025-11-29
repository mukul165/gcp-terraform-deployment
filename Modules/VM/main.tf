resource "google_compute_instance" "VM_Instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.disk_image
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      # Ephemeral public IP
    }
  }

  tags = var.instance_tags

  metadata_startup_script = <<-EOF
#!/bin/bash
exec > /var/log/startup-script.log 2>&1

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl restart nginx

cat <<HTML >/var/www/html/index.html
<!doctype html>
<html>
  <head>
    <title>Terraform Nginx</title>
  </head>
  <body>
    <h1>Success! Nginx installed via Terraform metadata startup script.</h1>
  </body>
</html>
HTML
EOF
}