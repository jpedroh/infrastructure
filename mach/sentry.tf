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

resource "sentry_project" "mach_rpl_crawler" {
  organization = var.sentry_organization_slug
  teams        = [var.sentry_team_slug]

  name     = "mach-rpl-crawler"
  platform = "nodejs"
}

resource "sentry_key" "mach_rpl_crawler" {
  organization = sentry_project.mach_rpl_crawler.organization

  project = sentry_project.mach_rpl_crawler.slug
  name    = "Default"
}
