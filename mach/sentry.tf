resource "sentry_project" "mach" {
  organization = var.sentry_organization_slug
  teams        = [var.sentry_team_slug]

  name     = local.project_name
  platform = "javascript-nextjs"
}

resource "sentry_key" "mach" {
  organization = sentry_project.mach.organization

  project = sentry_project.mach.slug
  name    = "Default"
}
