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
    destination_dir = "apps/web/build/client"
  }

  deployment_configs {
    production {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        SENTRY_AUTH_TOKEN   = var.sentry_auth_token

        // TursoDB tokens
        TURSO_CONNECTION_URL = "libsql://${data.turso_database.production.hostname}"
        TURSO_AUTH_TOKEN = resource.turso_database_token.production.jwt
      }
      environment_variables = {
        VITE_SENTRY_DSN         = sentry_key.mach.dsn_public
        VITE_SENTRY_ENVIRONMENT = "production"
      }
    }
    preview {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        SENTRY_AUTH_TOKEN   = var.sentry_auth_token

        // TursoDB tokens
        TURSO_CONNECTION_URL = "libsql://${data.turso_database.preview.hostname}"
        TURSO_AUTH_TOKEN = resource.turso_database_token.preview.jwt
      }
      environment_variables = {
        VITE_SENTRY_DSN         = sentry_key.mach.dsn_public
        VITE_SENTRY_ENVIRONMENT = "preview"
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
  content   = cloudflare_pages_project.mach.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
