output "cloudflare_account_id" {
  value = data.cloudflare_accounts.main.accounts.0.id
}

output "cloudflare_zone_id" {
  value = data.cloudflare_zone.jpedroh_dev.id
}

output "github_current_username" {
  value = data.github_user.current.login
}
