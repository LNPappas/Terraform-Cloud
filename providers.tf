terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.55.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    github = {
      source  = "hashicorp/github"
      version = "4.9.2"
    }
  }
}

provider "google" {
  project     = var.project_name
  region      = var.region
  credentials = var.google_credentials
}

provider "github" {
  token = var.github_token
}