resource "cloudflare_pages_project" "mach" {
  account_id        = var.cloudflare_account.id
  name              = local.project_name
  production_branch = github_branch_default.mach.branch

  source {
    type = "github"
    config {
      owner                         = var.github_username
      repo_name                     = github_repository.mach.name
      production_branch             = github_branch_default.mach.branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_branch_includes       = ["*"]
    }
  }

  build_config {
    build_command   = "pnpm pack:web"
    destination_dir = "apps/web/.vercel/output/static"
  }

  deployment_configs {
    production {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        DATABASE_HOST       = var.database_host_production
        DATABASE_USERNAME   = var.database_username_production
        DATABASE_PASSWORD   = var.database_password_production
        AISWEB_API_KEY      = var.aisweb_api_key
        AISWEB_API_PASSWORD = var.aisweb_api_password
        SENTRY_AUTH_TOKEN   = var.sentry_auth_token

        // TursoDB tokens
        TURSO_CONNECTION_URL = "libsql://mach-jpedroh.turso.io"
        TURSO_AUTH_TOKEN = var.turso_mach_token

        // NX Cache
        NXCACHE_AWS_ACCESS_KEY_ID     = var.cloudflare_r2_access_key_id
        NXCACHE_AWS_SECRET_ACCESS_KEY = var.cloudflare_r2_secret_access_key
        NXCACHE_AWS_ENDPOINT          = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
        NXCACHE_AWS_REGION            = "auto"
        NXCACHE_AWS_BUCKET            = cloudflare_r2_bucket.nx_cache_bucket.name
        NXCACHE_AWS_FORCE_PATH_STYLE  = "true"

        // Posthog
        NEXT_PUBLIC_POSTHOG_KEY       = var.posthog_key
        NEXT_PUBLIC_POSTHOG_HOST      = "https://us.posthog.com"
      }
      environment_variables = {
        NEXT_PUBLIC_SENTRY_DSN         = sentry_key.mach.dsn_public
        NEXT_PUBLIC_SENTRY_ENVIRONMENT = "production"
      }
    }
    preview {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        DATABASE_HOST       = var.database_host_preview
        DATABASE_USERNAME   = var.database_username_preview
        DATABASE_PASSWORD   = var.database_password_preview
        AISWEB_API_KEY      = var.aisweb_api_key
        AISWEB_API_PASSWORD = var.aisweb_api_password
        SENTRY_AUTH_TOKEN   = var.sentry_auth_token

        // TursoDB tokens
        TURSO_CONNECTION_URL = "libsql://mach-dev-jpedroh.turso.io"
        TURSO_AUTH_TOKEN = var.turso_mach_preview_token

        // NX Cache
        NXCACHE_AWS_ACCESS_KEY_ID     = var.cloudflare_r2_access_key_id
        NXCACHE_AWS_SECRET_ACCESS_KEY = var.cloudflare_r2_secret_access_key
        NXCACHE_AWS_ENDPOINT          = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
        NXCACHE_AWS_REGION            = "auto"
        NXCACHE_AWS_BUCKET            = cloudflare_r2_bucket.nx_cache_bucket.name
        NXCACHE_AWS_FORCE_PATH_STYLE  = "true"

        // Posthog
        NEXT_PUBLIC_POSTHOG_KEY       = var.posthog_key
        NEXT_PUBLIC_POSTHOG_HOST      = "https://us.posthog.com"
      }
      environment_variables = {
        NEXT_PUBLIC_SENTRY_DSN         = sentry_key.mach.dsn_public
        NEXT_PUBLIC_SENTRY_ENVIRONMENT = "preview"
      }
    }
  }
}

resource "cloudflare_pages_domain" "mach" {
  account_id   = var.cloudflare_account.id
  project_name = cloudflare_pages_project.mach.name
  domain       = "${local.project_name}.${var.cloudflare_zone.zone}"
}

resource "cloudflare_record" "mach" {
  zone_id = var.cloudflare_zone.id
  name    = local.project_name
  value   = cloudflare_pages_project.mach.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
