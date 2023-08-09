resource "cloudflare_pages_project" "jpedroh_dev" {
  account_id        = var.cloudflare_account_id
  name              = "jpedroh-dev"
  production_branch = github_branch_default.jpedroh_dev.branch

  source {
    type = "github"
    config {
      owner                         = var.github_username
      repo_name                     = github_repository.jpedroh_dev.name
      production_branch             = github_branch_default.jpedroh_dev.branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
    }
  }

  build_config {
    build_command   = "npx @cloudflare/next-on-pages@1"
    destination_dir = ".vercel/output/static"
  }

  deployment_configs {
    production {
      compatibility_flags = ["nodejs_compat"]
    }
    preview {
      compatibility_flags = ["nodejs_compat"]
    }
  }
}

resource "cloudflare_pages_domain" "alias" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.jpedroh_dev.name
  domain       = "jpedroh.dev"
}

resource "cloudflare_pages_domain" "www" {
  account_id   = var.cloudflare_account_id
  project_name = cloudflare_pages_project.jpedroh_dev.name
  domain       = "www.jpedroh.dev"
}

resource "cloudflare_record" "alias" {
  zone_id = var.cloudflare_zone_id
  name    = "@"
  value   = cloudflare_pages_project.jpedroh_dev.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  value   = cloudflare_pages_project.jpedroh_dev.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
