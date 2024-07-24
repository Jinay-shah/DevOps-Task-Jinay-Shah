# Terraform Variables Configuration
# This file defines the input variables used to configure Google Cloud resources such as VPC, subnets, and Cloud Run services.

variable "project_id" {
  description = "The ID of the Google Cloud project."
  type        = string
}

variable "region" {
  description = "The region where resources will be created."
  type        = string
  # valdation to allow limited region
  validation {
    condition     = var.region in ["us-central1", "europe-west1", "asia-east1", "us-west1", "europe-west2"]
    error_message = "The region must be one of the specified values."
  }
}

variable "vpc_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC network."
  type        = string
  # Add regex which will match the cidr format and gives error if it is wrong
  validation {
    condition     = can(regex("([0-9]{1,3}\.){3}[0-9]{1,3}($|/(8|16|24|32))$", var.vpc_cidr))
    error_message = "The vpc_cidr must be a valid CIDR notation."
  }
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets."
  type        = list(string)
   validation {
    condition     = alltrue([for cidr in var.subnet_cidrs : can(regex("([0-9]{1,3}\.){3}[0-9]{1,3}/(8|16|24|32)$", cidr))])
    error_message = "Each CIDR block in subnet_cidrs must be a valid CIDR notation."
  }
}

variable "service_name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "image_url" {
  description = "The container image URL for the Cloud Run service."
  type        = string
}

variable "memory" {
  description = "Memory allocation for the Cloud Run service."
  type        = string
  validation {
    condition     = var.memory in ["128Mi", "256Mi", "512Mi", "1Gi", "2Gi"]
    error_message = "The memory allocation must be one of the specified values."
  }
}

variable "container_port" {
  description = "The port that the container exposes."
  type        = number
  validation {
    condition     = var.container_port > 0 && var.container_port <= 65535
    error_message = "The container port must be between 1 and 65535."
  }
}
