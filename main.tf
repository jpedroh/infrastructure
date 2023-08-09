provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

provider "github" {
  token = var.github_token
}

provider "planetscale" {
  service_token_id = var.planetscale_service_token_id
  service_token    = var.planetscale_service_token
}

module "global" {
  source = "./global"

  cloudflare_account = var.cloudflare_account
  planetscale_service_organization = var.planetscale_service_organization
}

module "jpedroh_dev" {
  source     = "./jpedroh.dev"
  depends_on = [module.global]

  cloudflare_account_id = module.global.cloudflare_account_id
  cloudflare_zone_id    = module.global.cloudflare_zone_id
  github_username       = module.global.github_current_username
}

module "mach" {
  source     = "./mach"
  depends_on = [module.global]

  cloudflare_account_id = module.global.cloudflare_account_id
  cloudflare_zone_id    = module.global.cloudflare_zone_id
}

module "reading_list" {
  source     = "./reading-list"
  depends_on = [module.global]

  cloudflare_account_id = module.global.cloudflare_account_id
  cloudflare_zone_id    = module.global.cloudflare_zone_id
}
