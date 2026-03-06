terraform {
 backend "gcs" {
   bucket  = "gcp-terraform-state-dev1"
   prefix  = "terraform/state"
   
 }
}