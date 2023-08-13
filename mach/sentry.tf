resource "sentry_project" "mach" {
  organization = var.sentry_organization_slug
  teams = [ var.sentry_team_slug ]

  name     = local.project_name
  platform = "javascript-nextjs"
}

data "sentry_key" "mach" {
  organization = var.sentry_organization_slug
  project      = sentry_project.mach.slug

  first = true
}
