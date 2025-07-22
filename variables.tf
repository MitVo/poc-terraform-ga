variable "project_id" {
  type    = string
  default = "terraform-gh"
}

variable "region" {
  type        = string
  description = "Region to create all resources in "
  default     = "us-east1"
}