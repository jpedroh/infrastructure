resource "sentry_organization" "jpedroh" {
  name = local.sentry_organization_slug

  agree_terms = true
}
