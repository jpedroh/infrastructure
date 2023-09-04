resource "sentry_project" "reading_list" {
  organization = var.sentry_organization_slug
  teams = [ var.sentry_team_slug ]

  name     = local.project_name
  platform = "javascript-nextjs"
}

resource "sentry_key" "reading_list" {
  organization = sentry_project.reading_list.organization

  project = sentry_project.reading_list.slug
  name    = "Default"
}
