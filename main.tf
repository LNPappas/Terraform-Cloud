terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.55.0"
    }
  }
}

provider "google" {
  project = "demotfcloud"
  region  = "us-central1"
}
resource "google_storage_bucket" "gcs_bucket" {
  name = "test-bucket-terraform-cloud-pipeline"
}

resource "google_storage_bucket" "gcs_bucket" {
  name = "2-test-bucket-terraform-cloud-pipeline"
}