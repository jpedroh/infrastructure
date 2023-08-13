resource "sentry_organization" "jpedroh" {
  name = local.sentry_organization_name

  agree_terms = true
}

resource "sentry_team" "jpedroh" {
  organization = sentry_organization.jpedroh.slug
  name         = local.sentry_organization_name
}
