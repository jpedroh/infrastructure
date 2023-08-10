resource "cloudflare_pages_project" "todos_board" {
  account_id        = var.cloudflare_account.id
  name              = local.project_name
  production_branch = github_branch_default.todos_board.branch

  source {
    type = "github"
    config {
      owner                         = var.github_username
      repo_name                     = github_repository.todos_board.name
      production_branch             = github_branch_default.todos_board.branch
      pr_comments_enabled           = true
      deployments_enabled           = true
      production_deployment_enabled = true
      preview_branch_includes       = ["*"]
    }
  }

  build_config {
    build_command   = "npx nx build"
    destination_dir = "dist/todos-board"
  }
}

resource "cloudflare_pages_domain" "todos_board" {
  account_id   = var.cloudflare_account.id
  project_name = cloudflare_pages_project.todos_board.name
  domain       = "${local.project_name}.${var.cloudflare_zone.zone}"
}

resource "cloudflare_record" "todos_board" {
  zone_id = var.cloudflare_zone.id
  name    = local.project_name
  value   = cloudflare_pages_project.todos_board.subdomain
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
