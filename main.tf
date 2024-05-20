module "project" { 
  source = "./project"
  billing_account = var.billing_account
  project_id = var.project_id
  project_name = var.project_name
  google_apis = var.google_apis
}

module "vpc" { 
  project_id = var.project_id
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
  vpc_name = module.vpc.vpc_name
  vpc_subnet = module.vpc.vpc_subnet
  vpc_private_subnet = module.vpc.private_subnet
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
  vpc_name = module.vpc.vpc_name
  vpc_subnet = module.vpc.vpc_subnet 
}


