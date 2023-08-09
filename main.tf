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

provider "vercel" {
  api_token = var.vercel_api_token
}

module "global" {
  source = "./global"
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

  database_host_preview     = module.global.planetscale_database_preview_host
  database_username_preview = module.global.planetscale_database_preview_username
  database_password_preview = module.global.planetscale_database_preview_password
}

module "reading_list" {
  source     = "./reading-list"
  depends_on = [module.global]

  cloudflare_account_id = module.global.cloudflare_account_id
  cloudflare_zone_id    = module.global.cloudflare_zone_id

  database_host_production     = module.global.planetscale_database_production_host
  database_username_production = module.global.planetscale_database_production_username
  database_password_production = module.global.planetscale_database_production_password
  database_url_production      = module.global.planetscale_database_production_url

  database_host_preview     = module.global.planetscale_database_preview_host
  database_username_preview = module.global.planetscale_database_preview_username
  database_password_preview = module.global.planetscale_database_preview_password
  database_url_preview      = module.global.planetscale_database_preview_url

  otp_secret_production  = var.otp_secret_production
  otp_secret_dev_preview = var.otp_secret_dev_preview
}
