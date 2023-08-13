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
    build_command   = "npx nx build @mach/app && cd packages/app && npx @cloudflare/next-on-pages@1"
    destination_dir = "packages/app/.vercel/output/static"
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
        SENTRY_AUTH_TOKEN = var.sentry_auth_token
      }
      environment_variables = {
        NEXT_PUBLIC_SENTRY_DSN         = data.sentry_key.mach.dsn_public
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
        SENTRY_AUTH_TOKEN = var.sentry_auth_token
      }
      environment_variables = {
        NEXT_PUBLIC_SENTRY_DSN         = data.sentry_key.mach.dsn_public
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
