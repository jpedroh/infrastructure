resource "cloudflare_account" "main" {
  name = local.cloudflare_account_name
}

resource "cloudflare_zone" "jpedroh_dev" {
  account_id = cloudflare_account.main.id
  zone       = local.domain_name
}
