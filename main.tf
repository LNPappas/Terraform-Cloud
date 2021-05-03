resource "google_storage_bucket" "bucket_1" {
  project = var.project_name
  name    = var.bucket_1
}

resource "google_storage_bucket" "bucket_2" {
  project = var.project_name
  name    = var.bucket_2
}