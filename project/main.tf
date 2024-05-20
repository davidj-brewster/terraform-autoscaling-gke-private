resource "google_project" "default" {
  name       = "chess demo"
  project_id = var.project_id
  billing_account     = var.billing_account
}

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_service_list)
  project = var.project_id
  service = each.key
}

moved {
  to = google_project.default
  from = module.project.google_project.default
}

moved { 
  to = google_project_service.gcp_services
  from = module.project.google_project_service.gcp_services
}
