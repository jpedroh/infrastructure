data "cloudflare_accounts" "main" {
  name = var.cloudflare_account
}

data "cloudflare_zone" "jpedroh_dev" {
  account_id = data.cloudflare_accounts.main.accounts.0.id
  name       = "jpedroh.dev"
}
