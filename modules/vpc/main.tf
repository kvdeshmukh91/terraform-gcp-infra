resource "google_compute_network" "vpc" {
    name = var.vpc_name
    auto_create_subnetworks = false  
}

resource "google_compute_subnetwork" "subnet" {
    name = var.subnet_name
    region = var.region
    network = google_compute_network.vpc.id
    ip_cidr_range = var.subnet_cidr
  
}
resource "google_compute_firewall" "allow_ssh" {
    name = "${var.vpc_name}-allow-ssh"
    network = google_compute_network.vpc.name

    allow {
      protocol = "tcp"
      ports = ["22"]
    }
    source_ranges = ["0.0.0.0/0"]
}