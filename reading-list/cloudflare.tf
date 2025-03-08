resource "cloudflare_record" "reading_list" {
  zone_id = var.cloudflare_zone.id
  name    = local.project_name
  content   = cloudflare_pages_project.reading_list.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_pages_project" "reading_list" {
  account_id        = var.cloudflare_account.id
  name              = local.project_name
  production_branch = github_branch_default.reading_list.branch

  source {
    type = "github"
    config {
      owner                         = var.github_username
      repo_name                     = github_repository.reading_list.name
      production_branch             = github_branch_default.reading_list.branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_branch_includes       = ["*"]
    }
  }

  build_config {
    build_command   = "pnpm run pack"
    destination_dir = ".vercel/output/static"
  }

  deployment_configs {
    production {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        OTP_SECRET        = var.otp_secret_production
        OTP_USER          = local.otp_user
        OTP_SERVICE       = local.otp_service
        SENTRY_AUTH_TOKEN = var.sentry_auth_token

        // TursoDB tokens
        TURSO_CONNECTION_URL = "libsql://${data.turso_database.production.hostname}"
        TURSO_AUTH_TOKEN = resource.turso_database_token.production.jwt

        // NX Cache
        NXCACHE_AWS_ACCESS_KEY_ID     = var.cloudflare_r2_access_key_id
        NXCACHE_AWS_SECRET_ACCESS_KEY = var.cloudflare_r2_secret_access_key
        NXCACHE_AWS_ENDPOINT          = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
        NXCACHE_AWS_REGION            = "auto"
        NXCACHE_AWS_BUCKET            = cloudflare_r2_bucket.nx_cache_bucket.name
        NXCACHE_AWS_FORCE_PATH_STYLE  = "true"
      }
      environment_variables = {
        NEXT_PUBLIC_SENTRY_DSN         = sentry_key.reading_list.dsn_public
        NEXT_PUBLIC_SENTRY_ENVIRONMENT = "production"
      }
    }
    preview {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        OTP_SECRET        = var.otp_secret_dev_preview
        OTP_USER          = local.otp_user
        OTP_SERVICE       = local.otp_service
        SENTRY_AUTH_TOKEN = var.sentry_auth_token

        // TursoDB tokens
        TURSO_CONNECTION_URL = "libsql://${data.turso_database.preview.hostname}"
        TURSO_AUTH_TOKEN = resource.turso_database_token.preview.jwt

        // NX Cache
        NXCACHE_AWS_ACCESS_KEY_ID     = var.cloudflare_r2_access_key_id
        NXCACHE_AWS_SECRET_ACCESS_KEY = var.cloudflare_r2_secret_access_key
        NXCACHE_AWS_ENDPOINT          = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
        NXCACHE_AWS_REGION            = "auto"
        NXCACHE_AWS_BUCKET            = cloudflare_r2_bucket.nx_cache_bucket.name
        NXCACHE_AWS_FORCE_PATH_STYLE  = "true"
      }
      environment_variables = {
        NEXT_PUBLIC_SENTRY_DSN         = sentry_key.reading_list.dsn_public
        NEXT_PUBLIC_SENTRY_ENVIRONMENT = "preview"
      }
    }
  }
}

resource "cloudflare_pages_domain" "reading_list" {
  account_id   = var.cloudflare_account.id
  project_name = cloudflare_pages_project.reading_list.name
  domain       = "${local.project_name}.${var.cloudflare_zone.zone}"
}
