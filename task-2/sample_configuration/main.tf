# Specify the Terraform provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.38.0"
    }
  }
}

# Configure the Google Cloud provider
provider "google" {
  project = var.project_id
  region  = var.region
}

# Call the module
module "vpc_subnets_cloudrun" {
  source = "../terraform_module/vpc_subnets_cloudrun"  

  project_id     = "my-gcp-project"           
  region         = "us-central1"              
  vpc_name       = "my-vpc"                   
  vpc_cidr       = "10.0.0.0/16"              
  subnet_cidrs   = [                          
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
  service_name   = "my-cloud-run-service"     
  image_url      = "gcr.io/my-project/my-image:v1"  
  memory         = "512Mi"                    
  container_port = 5000                       
}


# Output values from the module
output "vpc_network_name" {
  value = module.vpc_subnets_cloud_run.vpc_network_name
}

output "vpc_network_cidr" {
  value = module.vpc_subnets_cloud_run.vpc_network_cidr
}

output "subnet_names" {
  value = module.vpc_subnets_cloud_run.subnet_names
}

output "subnet_cidrs" {
  value = module.vpc_subnets_cloud_run.subnet_cidrs
}

output "cloud_run_service_location" {
  value = module.vpc_subnets_cloud_run.cloud_run_service_location
}

output "cloud_run_service_name" {
  value = module.vpc_subnets_cloud_run.cloud_run_service_name
}

output "cloud_run_service_invoker_role" {
  value = module.vpc_subnets_cloud_run.cloud_run_service_invoker_role
}