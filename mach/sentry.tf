resource "sentry_project" "reading_list" {
  organization = var.sentry_organization_slug
  teams = [ var.sentry_team_slug ]

  name     = local.project_name
  platform = "javascript"
}

data "sentry_key" "reading_list" {
  organization = var.sentry_organization_slug
  project      = sentry_project.reading_list.slug

  first = true
}
