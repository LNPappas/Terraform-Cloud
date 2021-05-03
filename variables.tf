variable "bucket_1" {
  type        = string
  description = "name of 1st bucket"
  default     = ""
}

variable "bucket_2" {
  type        = string
  description = "name of 2nd bucket"
  default     = ""
}

variable "project_name" {
  type        = string
  description = "name of GCP project"
  default     = ""
}

variable "region" {
  type        = string
  description = "region of project/buckets"
  default     = ""
}

variable "github_token" {
  type        = string
  description = "token for github"
}

variable "google_credentials" {
  type        = string
  description = "GCP credentials"
}
