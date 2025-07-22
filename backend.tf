terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.38"
    }
  }
  backend "gcs" {
    bucket = "github-action-with-terraform"
    prefix = "githubAction"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}