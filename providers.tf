terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.55.0"
    }

    github = {
      source = "hashicorp/github"
    }
  }
}

provider "google" {
  project = var.project_name
  region  = var.region
}

provider "github" {
  token        = var.github_token
}