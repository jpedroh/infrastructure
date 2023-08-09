output "cloudflare_account_id" {
  value = data.cloudflare_accounts.main.accounts.0.id
}

output "cloudflare_zone_id" {
  value = data.cloudflare_zone.jpedroh_dev.id
}

output "github_current_username" {
  value = data.github_user.current.login
}

output "planetscale_database_production_host" {
  value = data.planetscale_database_branch_passwords.production.passwords.0.hostname
}

output "planetscale_database_production_username" {
  value = data.planetscale_database_branch_passwords.production.passwords.0.username
}

output "planetscale_database_production_password" {
  value = data.planetscale_database_branch_passwords.production.passwords.0.plaintext
}

output "planetscale_database_preview_host" {
   value = data.planetscale_database_branch_passwords.preview.passwords.0.hostname
}

output "planetscale_database_preview_username" {
   value = data.planetscale_database_branch_passwords.preview.passwords.0.username
}

output "planetscale_database_preview_password" {
   value = data.planetscale_database_branch_passwords.preview.passwords.0.plaintext
}
