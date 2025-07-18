# Terraform GCP GitHub Actions Example

This repository demonstrates how to use GitHub Actions to automate Terraform workflows for deploying resources on Google Cloud Platform (GCP).

## Project Structure

- **main.tf**: Defines a GCP Storage Bucket resource.
- **variables.tf**: Contains input variables for project configuration.
- **backend.tf**: Configures the Terraform backend to use a GCS bucket for state storage and sets up the Google provider.
- **.github/workflows/**: Contains GitHub Actions workflows for planning and applying Terraform changes.

## Workflows

- **Pull Requests**: When a PR is opened or updated against `main`, the [execution-flow-pr.yml](.github/workflows/execution-flow-pr.yml) workflow runs a Terraform plan.
- **Push to Main**: When changes are pushed to `main`, the [execution-flow-push.yml](.github/workflows/execution-flow-push.yml) workflow applies the Terraform changes.

These workflows call reusable workflows:
- [terraform-plan.yml](.github/workflows/terraform-plan.yml): Runs `terraform plan`.
- [terraform-apply.yml](.github/workflows/terraform-apply.yml): Runs `terraform apply`.

## Prerequisites

- A GCP project and a service account with permissions to manage resources and write to the state bucket.
- A GCS bucket for storing Terraform state (`github-action-gcp-bucket` by default).
- GitHub repository secrets:
  - `GCP_CREDENTIALS`: The base64-encoded service account key JSON.

## Usage

1. **Clone the repository** and update variables as needed in [variables.tf](variables.tf).
2. **Set up GitHub Secrets**:
   - Go to your repository settings > Secrets and variables > Actions.
   - Add `GCP_CREDENTIALS` with your service account key.
3. **Push changes** or open a pull request to trigger the workflows.

## Terraform Resources

This example creates a GCP Storage Bucket:

```hcl
resource "google_storage_bucket" "Cloud_function_bucket" {
  name      = "github-action-with-terraform-${var.project_id}"
  location  = var.region
  project   = var.project_id
  force_destroy = true
  uniform_bucket_level_access = true
}