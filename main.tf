terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.55.0"
    }
  }
}
resource "google_storage_bucket" "gcs_bucket" {
  name = "test-bucket-terraform-cloud-pipeline"
}