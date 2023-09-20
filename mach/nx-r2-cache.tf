resource "cloudflare_r2_bucket" "nx_cache_bucket" {
  account_id = var.cloudflare_account.id
  name       = "${local.project_name}-nx-cache"
}
