variable "billing_account" {
  type        = string
  description = "Required for project setup and some other operations"
}

variable "project_id" {
  type        = string
  description = "The ID of the project that is created via terraform"
}

variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "vpc_name" {
  type        = string
  description = "Identifier of the VPC network"
  default     = "default-vpc"
}

variable "google_apis" {
  type        = list(string)
  description = "Set of extra Google APIs that need to be enabled"
  default = [
    "container.googleapis.com",
    "cloudbuild.googleapis.com",
    "run.googleapis.com",
    "alloydb.googleapis.com",
    "containerregistry.googleapis.com",
    "compute.googleapis.com",
    "dns.googleapis.com",
    "iam.googleapis.com"
  ]
}

variable "region" {
  type        = string
  description = "The region in which to create the GKE cluster"
  default     = "asia-southeast1"
}

variable "vpc_subnet" {
  type        = string
  description = "Subnet name we'll use for GKE"
  default     = "default-vpc-subnet-gke"
}

variable "gke_serviceaccount" {
  type        = string
  description = "Terraform managaed serviceaccount for the compute scope"
  default     = "svcacct-gke-compute-tfpoc"
}

variable "allowed_ssh_ips" {
  description = "IPs allowed to access a bastian host to reach the control plane"
  type = string
  default = "127.0.0.1"
}

variable "public_subnet_range" { 
  type = string
  default = "10.3.0.0/24"
  description = "The IPs to assign to the public subnet, which will host the jump host"
}

variable "public_subnet_name" {
  type = string
  default = "vpc-subnet-pub"
}


