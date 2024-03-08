output "cloudflare_account" {
  value = cloudflare_account.main
}

output "cloudflare_zone" {
  value = cloudflare_zone.jpedroh_dev
}

output "github_current_username" {
  value = data.github_user.current.login
}

output sentry_organization_slug {
  value = sentry_organization.jpedroh.slug
}

output sentry_team_slug {
  value = sentry_team.jpedroh.slug
}
