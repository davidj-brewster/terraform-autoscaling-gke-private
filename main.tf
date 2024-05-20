module "project" { 
  source = "./project"
  billing_account = var.billing_account
  project_id = var.project_id
  project_name = var.project_name
  google_apis = var.google_apis
}

module "vpc" { 
  project_id = var.project_id
  vpc_name = var.vpc_name
  vpc_subnet = var.vpc_subnet
  source = "./vpc"
  depends_on = [ module.project ]
}

module "firewall_rules" {
  source = "./firewall_rules"
  depends_on = [ 
    module.project,
    module.vpc
  ]
  project_id = var.project_id
  vpc_name = var.vpc_name
  vpc_subnet = var.vpc_subnet
#  vpc_private_subnet = module.vpc.private_subnet #TBD
}

module "gke" {
  source = "./gke"
  depends_on = [ 
    module.vpc,
    module.firewall_rules,
    module.project
  ]
  project_id = var.project_id
  billing_account = var.billing_account
  region = var.region
  vpc_name = var.vpc_name
  vpc_subnet = var.vpc_subnet 
}


