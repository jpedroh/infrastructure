resource "github_repository" "mach" {
  name             = local.project_name
  description      = "An open-source tool for flight simulation"
  allow_auto_merge = true
  has_downloads    = true
  has_issues       = true
  has_projects     = true
  has_wiki         = true
  homepage_url     = "https://mach.jpedroh.dev/"
  topics = [
    "flight-simulation",
  ]
  vulnerability_alerts = true
}

resource "github_branch" "main" {
  repository    = github_repository.mach.name
  branch        = "main"
  source_branch = "master"
}

resource "github_branch_default" "mach" {
  repository = github_repository.mach.name
  branch     = github_branch.main.branch
}

resource "github_actions_secret" "database_host_preview" {
  repository      = github_repository.mach.name
  secret_name     = "database_host_preview"
  plaintext_value = var.database_host_preview
}

resource "github_actions_secret" "database_username_preview" {
  repository      = github_repository.mach.name
  secret_name     = "database_username_preview"
  plaintext_value = var.database_username_preview
}

resource "github_actions_secret" "database_password_preview" {
  repository      = github_repository.mach.name
  secret_name     = "database_password_preview"
  plaintext_value = var.database_password_preview
}

resource "github_actions_secret" "database_host_production" {
  repository      = github_repository.mach.name
  secret_name     = "database_host_production"
  plaintext_value = var.database_host_production
}

resource "github_actions_secret" "database_username_production" {
  repository      = github_repository.mach.name
  secret_name     = "database_username_production"
  plaintext_value = var.database_username_production
}

resource "github_actions_secret" "database_password_production" {
  repository      = github_repository.mach.name
  secret_name     = "database_password_production"
  plaintext_value = var.database_password_production
}

resource "github_actions_secret" "aisweb_api_key" {
  repository      = github_repository.mach.name
  secret_name     = "aisweb_api_key"
  plaintext_value = var.aisweb_api_key
}

resource "github_actions_secret" "aisweb_api_password" {
  repository      = github_repository.mach.name
  secret_name     = "aisweb_api_password"
  plaintext_value = var.aisweb_api_password
}

resource "github_dependabot_secret" "database_host_preview" {
  repository      = github_repository.mach.name
  secret_name     = "database_host_preview"
  plaintext_value = var.database_host_preview
}

resource "github_dependabot_secret" "database_username_preview" {
  repository      = github_repository.mach.name
  secret_name     = "database_username_preview"
  plaintext_value = var.database_username_preview
}

resource "github_dependabot_secret" "database_password_preview" {
  repository      = github_repository.mach.name
  secret_name     = "database_password_preview"
  plaintext_value = var.database_password_preview
}

resource "github_dependabot_secret" "aisweb_api_key" {
  repository      = github_repository.mach.name
  secret_name     = "aisweb_api_key"
  plaintext_value = var.aisweb_api_key
}

resource "github_dependabot_secret" "aisweb_api_password" {
  repository      = github_repository.mach.name
  secret_name     = "aisweb_api_password"
  plaintext_value = var.aisweb_api_password
}

resource "github_actions_secret" "nxcache_aws_access_key_id" {
  repository = github_repository.mach.name
  secret_name = "nxcache_aws_access_key_id"
  plaintext_value = var.cloudflare_r2_access_key_id
}

resource "github_actions_secret" "nxcache_aws_secret_access_key" {
  repository = github_repository.mach.name
  secret_name = "nxcache_aws_secret_access_key"
  plaintext_value = var.cloudflare_r2_secret_access_key
}

resource "github_actions_secret" "nxcache_aws_endpoint" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_endpoint"
  plaintext_value = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
}

resource "github_actions_secret" "nxcache_aws_region" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_region"
  plaintext_value = "auto"
}

resource "github_actions_secret" "nxcache_aws_bucket" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_bucket"
  plaintext_value = cloudflare_r2_bucket.nx_cache_bucket.name
}

resource "github_actions_secret" "nxcache_aws_force_path_style" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_force_path_style"
  plaintext_value = "true"
}

resource "github_actions_secret" "rpl_crawler_sentry_dsn" {
  repository      = github_repository.mach.name
  secret_name     = "rpl_crawler_sentry_dsn"
  plaintext_value = sentry_key.mach_rpl_crawler.dsn_public
}

resource "github_dependabot_secret" "nxcache_aws_access_key_id" {
  repository = github_repository.mach.name
  secret_name = "nxcache_aws_access_key_id"
  plaintext_value = var.cloudflare_r2_access_key_id
}

resource "github_dependabot_secret" "nxcache_aws_secret_access_key" {
  repository = github_repository.mach.name
  secret_name = "nxcache_aws_secret_access_key"
  plaintext_value = var.cloudflare_r2_secret_access_key
}

resource "github_dependabot_secret" "nxcache_aws_endpoint" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_endpoint"
  plaintext_value = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
}

resource "github_dependabot_secret" "nxcache_aws_region" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_region"
  plaintext_value = "auto"
}

resource "github_dependabot_secret" "nxcache_aws_bucket" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_bucket"
  plaintext_value = cloudflare_r2_bucket.nx_cache_bucket.name
}

resource "github_dependabot_secret" "nxcache_aws_force_path_style" {
  repository      = github_repository.mach.name
  secret_name     = "nxcache_aws_force_path_style"
  plaintext_value = "true"
}
