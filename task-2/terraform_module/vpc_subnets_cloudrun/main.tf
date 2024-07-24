# This specify the provider of terraform (used to configure settings related to Terraform itself)
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

# This mention that we are using google cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Create a VPC network and define the range for vpc
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  ipv4_range              = var.vpc_cidr
}

# Create subnets within the VPC
resource "google_compute_subnetwork" "subnet" {
  # It sets the number of subnetworks to create based on the length of the subnet_cidrs list
  count = length(var.subnet_cidrs)
  # The name of each subnetwork is dynamically generated
  # It uses the VPC network name and the index of the current subnetwork
  name = "${var.vpc_name}-subnet-${count.index}"

  # 'ip_cidr_range' specifies the IP address range for the subnetwork
  # The 'element' function is used to fetch the CIDR block from the subnet_cidrs list based on the current index
  ip_cidr_range = element(var.subnet_cidrs, count.index)

  # The region where the subnetwork will be created
  region = var.region
}


# Define the Cloud Run service
resource "google_cloud_run_service" "my_service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image_url
        resources {
          limits {
            memory = var.memory
          }
        }
        ports {
          container_port = var.container_port
        }
      }
    }
  }


}

# Policy to allow public access to the Cloud Run service
resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.my_service.name
  location = google_cloud_run_service.my_service.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
