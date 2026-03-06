terraform {
 backend "gcs" {
   bucket  = "gcp-terraform-state-bucket"
   prefix  = "terraform/state"
 }
}