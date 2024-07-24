# Defines variables used in Terraform configurations. 
# These variables allow customization of resource settings by providing values through a separate `terraform.tfvars` file.

variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The region for the GCP resources"
  type        = string
  default     = "us-east1"
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
  default     = "hello-world-service"
}

variable "image_url" {
  description = "The URL of the Docker image in Artifact Registry"
  type        = string
}
