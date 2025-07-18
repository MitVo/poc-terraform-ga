terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.38"
    }
  }
  backend "gcp" {
    bucket = "github-action-gcp-bucket"
    prefix = "githubAction"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}