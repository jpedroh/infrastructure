output "cloudflare_account" {
  value = cloudflare_account.main
}

output "cloudflare_zone" {
  value = cloudflare_zone.jpedroh_dev
}

output "github_current_username" {
  value = data.github_user.current.login
}

output "planetscale_database_production_host" {
  value     = local.planetscale_hostname
  sensitive = false
}

output "planetscale_database_production_username" {
  value     = planetscale_database_branch_password.production.username
  sensitive = true
}

output "planetscale_database_production_password" {
  value     = planetscale_database_branch_password.production.plaintext
  sensitive = true
}

output "planetscale_database_production_url" {
  value     = format("mysql://%s:%s@%s/%s?ssl={\"rejectUnauthorized\":true}", planetscale_database_branch_password.production.username, planetscale_database_branch_password.production.plaintext, local.planetscale_hostname, local.database_name)
  sensitive = true
}

output "planetscale_database_preview_host" {
  value     = local.planetscale_hostname
  sensitive = false
}

output "planetscale_database_preview_username" {
  value     = planetscale_database_branch_password.preview.username
  sensitive = true
}

output "planetscale_database_preview_password" {
  value     = planetscale_database_branch_password.preview.plaintext
  sensitive = true
}

output "planetscale_database_preview_url" {
  value     = format("mysql://%s:%s@%s/%s?ssl={\"rejectUnauthorized\":true}", planetscale_database_branch_password.preview.username, planetscale_database_branch_password.preview.plaintext, local.planetscale_hostname, local.database_name)
  sensitive = true
}

output sentry_organization_slug {
  value = sentry_organization.jpedroh.slug
}

output sentry_team_slug {
  value = sentry_team.jpedroh.slug
}
