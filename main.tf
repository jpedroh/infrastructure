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

provider "sentry" {
  token = var.sentry_token
}

provider "aws" {
  region     = "us-east-1"
  access_key = var.cloudflare_r2_access_key_id
  secret_key = var.cloudflare_r2_secret_access_key
  skip_credentials_validation = true
  skip_region_validation = true
  skip_requesting_account_id = true
  endpoints {
    s3 = "https://${module.global.cloudflare_account.id}.r2.cloudflarestorage.com"
  }
}

provider "turso" {
  api_token = var.turso_api_token
}

module "global" {
  source = "./global"
}

module "jpedroh_dev" {
  source     = "./jpedroh.dev"
  depends_on = [module.global]

  cloudflare_account = module.global.cloudflare_account
  cloudflare_zone    = module.global.cloudflare_zone
  github_username    = module.global.github_current_username
}

module "mach" {
  source     = "./mach"
  depends_on = [module.global]

  cloudflare_account = module.global.cloudflare_account
  cloudflare_zone    = module.global.cloudflare_zone

  github_username = module.global.github_current_username

  aisweb_api_key      = var.aisweb_api_key
  aisweb_api_password = var.aisweb_api_password

  sentry_organization_slug = module.global.sentry_organization_slug
  sentry_team_slug         = module.global.sentry_team_slug
  sentry_auth_token        = var.sentry_token

  cloudflare_r2_access_key_id     = var.cloudflare_r2_access_key_id
  cloudflare_r2_secret_access_key = var.cloudflare_r2_secret_access_key

  posthog_key = var.posthog_key

  turso_mach_token = var.turso_mach_token
  turso_mach_preview_token = var.turso_mach_preview_token
}

module "reading_list" {
  source     = "./reading-list"
  depends_on = [module.global]

  cloudflare_account = module.global.cloudflare_account
  cloudflare_zone    = module.global.cloudflare_zone

  github_username = module.global.github_current_username

  otp_secret_production  = var.otp_secret_production
  otp_secret_dev_preview = var.otp_secret_dev_preview

  sentry_organization_slug = module.global.sentry_organization_slug
  sentry_team_slug         = module.global.sentry_team_slug
  sentry_auth_token        = var.sentry_token

  cloudflare_r2_access_key_id     = var.cloudflare_r2_access_key_id
  cloudflare_r2_secret_access_key = var.cloudflare_r2_secret_access_key

  turso_api_token = var.turso_api_token
}
