module "vpc" {
  source      = "./modules/vpc"
  vpc_name    = "tf-vpc"
  subnet_name = "tf-subnet"
  subnet_cidr = "10.10.0.0/16"
  region      = var.region
}


module "spot_vm" {
  source        = "./modules/spot-vm"
  name          = "tf-spot-vm"
  zone          = "asia-south1-a"
  machine_type  = "e2-medium"
  network       = module.vpc.vpc_name
  subnetwork    = module.vpc.subnet_name
}

# resource "google_compute_instance" "vm" {
#   name         = var.vm_name
#   machine_type = "e2-micro"
#   zone         = "asia-south1-a"

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-12"
#     }
#   }

#   network_interface {
#     subnetwork = module.vpc.subnet_name
#     access_config {}
#   }
# }