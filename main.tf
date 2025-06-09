terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.38.0"
    }
  }
  required_version = ">= 1.5.7"
}

module "project" {
  source          = "./project"
  billing_account = var.billing_account
  project_id      = var.project_id
  project_name    = var.project_name
  google_apis     = var.google_apis
}

module "vpc" {
  project_id = var.project_id
  vpc_name   = var.vpc_name
  vpc_subnet = var.vpc_subnet
  source     = "./vpc"
  depends_on = [module.project]
  allowed_ssh_ips = var.allowed_ssh_ips
  region = var.region
  public_subnet_range = var.public_subnet_range
  public_subnet_name = var.public_subnet_name
}

module "firewall_rules" {
  source = "./firewall_rules"
  depends_on = [
    module.project,
    module.vpc
  ]
  project_id = var.project_id
  vpc_name = var.vpc_name
  public_subnet_name = var.public_subnet_name
  public_subnet_range = var.public_subnet_range
  allowed_ssh_ips = var.allowed_ssh_ips
  vpc_subnet = var.vpc_subnet
}

module "gke" {
  source = "./gke"
  depends_on = [ 
    module.project,
    module.vpc,
    module.firewall_rules
  ]
  project_id         = var.project_id
  billing_account    = var.billing_account
  region             = var.region
  vpc_name           = var.vpc_name
  vpc_subnet         = var.vpc_subnet
  gke_serviceaccount = var.gke_serviceaccount
  public_subnet_name = var.public_subnet_name
  public_subnet_range = var.public_subnet_range
  allowed_ssh_ips = var.allowed_ssh_ips
}
