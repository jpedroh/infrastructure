output "cloudflare_account_id" {
  value = cloudflare_account.main.id
}

output "cloudflare_zone_id" {
  value = cloudflare_zone.jpedroh_dev.id
}

output "github_current_username" {
  value = data.github_user.current.login
}

output "planetscale_database_production_host" {
  value     = data.planetscale_database_branch_passwords.production.passwords.0.hostname
  sensitive = true
}

output "planetscale_database_production_username" {
  value     = data.planetscale_database_branch_passwords.production.passwords.0.username
  sensitive = true
}

output "planetscale_database_production_password" {
  value     = data.planetscale_database_branch_passwords.production.passwords.0.plaintext
  sensitive = true
}

output "planetscale_database_preview_host" {
  value     = data.planetscale_database_branch_passwords.preview.passwords.0.hostname
  sensitive = true
}

output "planetscale_database_preview_username" {
  value     = data.planetscale_database_branch_passwords.preview.passwords.0.username
  sensitive = true
}

output "planetscale_database_preview_password" {
  value     = data.planetscale_database_branch_passwords.preview.passwords.0.plaintext
  sensitive = true
}

output "planetscale_database_preview_url" {
  value     = format("mysql://%s:%s@%s/%s?ssl={\"rejectUnauthorized\":true}", data.planetscale_database_branch_passwords.preview.passwords.0.username, data.planetscale_database_branch_passwords.preview.passwords.0.plaintext, data.planetscale_database_branch_passwords.preview.passwords.0.hostname, local.database_name)
  sensitive = true
}
