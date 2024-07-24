#outputs.tf specifies which values we want to see after the resources are created.
# I have list out the important configuration data whose value are being displayed after the resources gets created
output "vpc_network_name" {
  description = "The name of the VPC network."
  value       = google_compute_network.vpc_network.name
}

output "vpc_network_cidr" {
  description = "The CIDR block of the VPC network."
  value       = google_compute_network.vpc_network.ipv4_range
}

output "subnet_names" {
  description = "The names of the subnets."
  value       = [for s in google_compute_subnetwork.subnet : s.name]
}

output "subnet_cidrs" {
  description = "The CIDR blocks of the subnets."
  value       = [for s in google_compute_subnetwork.subnet : s.ip_cidr_range]
}

output "cloud_run_service_url" {
  description = "The URL of the Cloud Run service."
  value       = google_cloud_run_service.my_service.status[0].url
}

output "cloud_run_service_location" {
  description = "The location of the Cloud Run service."
  value       = google_cloud_run_service.my_service.location
}

output "cloud_run_service_name" {
  description = "The name of the Cloud Run service."
  value       = google_cloud_run_service.my_service.name
}

output "cloud_run_service_invoker_role" {
  description = "IAM role assigned to the public access policy for Cloud Run service."
  value       = google_cloud_run_service_iam_member.invoker.role
}