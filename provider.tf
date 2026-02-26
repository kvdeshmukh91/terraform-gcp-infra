provider "google" {
  credentials = file("${path.module}/sa-key.json")
  project = var.project_id
  region  = var.region
}
