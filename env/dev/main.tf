module "vpc" {
  source      = "../../modules/vpc"

  vpc_name    = "dev-vpc"
  subnet_name = "dev-subnet"
  subnet_cidr = "10.10.0.0/16"
  region      = var.region
}

module "spot_vm" {
  source       = "../../modules/spot-vm"

  name         = "dev-spot-vm"
  machine_type = "e2-micro"
  zone         = var.zone
  network      = module.vpc.vpc_id
  subnetwork   = module.vpc.subnet_name
}