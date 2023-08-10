resource "cloudflare_record" "reading_list" {
  zone_id = var.cloudflare_zone_id
  name    = local.project_name
  value   = "cname.vercel-dns.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}

resource "cloudflare_pages_project" "reading_list" {
  account_id        = var.cloudflare_account_id
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
    build_command   = "npx @cloudflare/next-on-pages@1"
    destination_dir = ".vercel/output/static"
  }

  deployment_configs {
    production {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        DATABASE_HOST     = var.database_host_production
        DATABASE_USERNAME = var.database_username_production
        DATABASE_PASSWORD = var.database_password_production
        OTP_SECRET        = var.otp_secret_production
        OTP_USER          = local.otp_user
        OTP_SERVICE       = local.otp_service
      }
    }
    preview {
      compatibility_flags = ["nodejs_compat"]
      secrets = {
        DATABASE_HOST     = var.database_host_preview
        DATABASE_USERNAME = var.database_username_preview
        DATABASE_PASSWORD = var.database_password_preview
        OTP_SECRET        = var.otp_secret_dev_preview
        OTP_USER          = local.otp_user
        OTP_SERVICE       = local.otp_service
      }
    }
  }
}

resource "cloudflare_pages_domain" "reading_list_pages" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.reading_list.name
  domain       = "${local.project_name}-pages.jpedroh.dev"
}

resource "cloudflare_record" "reading_list_pages" {
  zone_id = var.cloudflare_zone_id
  name    = "${local.project_name}-pages"
  value   = cloudflare_pages_project.reading_list.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "wait_for_pages_deployment" {
  name = "${local.project_name}_wait_for_pages_deployment"

  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Pages Read"],
    ]
    resources = {
      "com.cloudflare.api.account.${var.cloudflare_account_id}" = "*"
    }
  }
}
