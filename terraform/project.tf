resource "google_project" "main_project" {
  name            = var.project_name
  project_id      = "${var.project_name}-${random_id.main_project.hex}"
  folder_id       = var.folder_id
  billing_account = var.billing_account
}
