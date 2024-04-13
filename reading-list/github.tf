resource "github_repository" "reading_list" {
  name             = local.project_name
  description      = "A personal reading list to save interesting articles regarding Software Engineering."
  allow_auto_merge = true
  has_downloads    = true
  has_issues       = true
  has_projects     = true
  has_wiki         = true
  homepage_url     = "https://reading-list.jpedroh.dev"
}

resource "github_branch" "main" {
  repository = github_repository.reading_list.name
  branch     = "main"
}

resource "github_branch_default" "reading_list" {
  repository = github_repository.reading_list.name
  branch     = github_branch.main.branch
}

resource "github_actions_secret" "otp_secret" {
  repository      = github_repository.reading_list.name
  secret_name     = "otp_secret"
  plaintext_value = var.otp_secret_dev_preview
}

resource "github_actions_secret" "otp_user" {
  repository      = github_repository.reading_list.name
  secret_name     = "otp_user"
  plaintext_value = local.otp_user
}

resource "github_actions_secret" "otp_service" {
  repository      = github_repository.reading_list.name
  secret_name     = "otp_service"
  plaintext_value = local.otp_service
}

resource "github_actions_secret" "cloudflare_account_id" {
  repository      = github_repository.reading_list.name
  secret_name     = "cloudflare_account_id"
  plaintext_value = var.cloudflare_account.id
}

resource "github_actions_secret" "cloudflare_project_name" {
  repository      = github_repository.reading_list.name
  secret_name     = "cloudflare_project_name"
  plaintext_value = cloudflare_pages_project.reading_list.name
}

resource "github_dependabot_secret" "otp_secret" {
  repository      = github_repository.reading_list.name
  secret_name     = "otp_secret"
  plaintext_value = var.otp_secret_dev_preview
}

resource "github_dependabot_secret" "otp_user" {
  repository      = github_repository.reading_list.name
  secret_name     = "otp_user"
  plaintext_value = local.otp_user
}

resource "github_dependabot_secret" "otp_service" {
  repository      = github_repository.reading_list.name
  secret_name     = "otp_service"
  plaintext_value = local.otp_service
}

resource "github_dependabot_secret" "cloudflare_account_id" {
  repository      = github_repository.reading_list.name
  secret_name     = "cloudflare_account_id"
  plaintext_value = var.cloudflare_account.id
}

resource "github_dependabot_secret" "cloudflare_project_name" {
  repository      = github_repository.reading_list.name
  secret_name     = "cloudflare_project_name"
  plaintext_value = cloudflare_pages_project.reading_list.name
}

resource "github_actions_secret" "nxcache_aws_access_key_id" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_access_key_id"
  plaintext_value = var.cloudflare_r2_access_key_id
}

resource "github_actions_secret" "nxcache_aws_secret_access_key" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_secret_access_key"
  plaintext_value = var.cloudflare_r2_secret_access_key
}

resource "github_actions_secret" "nxcache_aws_endpoint" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_endpoint"
  plaintext_value = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
}

resource "github_actions_secret" "nxcache_aws_region" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_region"
  plaintext_value = "auto"
}

resource "github_actions_secret" "nxcache_aws_bucket" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_bucket"
  plaintext_value = cloudflare_r2_bucket.nx_cache_bucket.name
}

resource "github_actions_secret" "nxcache_aws_force_path_style" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_force_path_style"
  plaintext_value = "true"
}

resource "github_dependabot_secret" "nxcache_aws_access_key_id" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_access_key_id"
  plaintext_value = var.cloudflare_r2_access_key_id
}

resource "github_dependabot_secret" "nxcache_aws_secret_access_key" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_secret_access_key"
  plaintext_value = var.cloudflare_r2_secret_access_key
}

resource "github_dependabot_secret" "nxcache_aws_endpoint" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_endpoint"
  plaintext_value = "https://${var.cloudflare_account.id}.r2.cloudflarestorage.com/"
}

resource "github_dependabot_secret" "nxcache_aws_region" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_region"
  plaintext_value = "auto"
}

resource "github_dependabot_secret" "nxcache_aws_bucket" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_bucket"
  plaintext_value = cloudflare_r2_bucket.nx_cache_bucket.name
}

resource "github_dependabot_secret" "nxcache_aws_force_path_style" {
  repository      = github_repository.reading_list.name
  secret_name     = "nxcache_aws_force_path_style"
  plaintext_value = "true"
}

resource "github_actions_secret" "turso_connection_url" {
  repository      = github_repository.reading_list.name
  secret_name     = "turso_connection_url"
  plaintext_value = "libsql://${data.turso_database.preview.hostname}"
}

resource "github_dependabot_secret" "turso_connection_url" {
  repository      = github_repository.reading_list.name
  secret_name     = "turso_connection_url"
  plaintext_value = "libsql://${data.turso_database.preview.hostname}"
}

resource "github_actions_secret" "turso_auth_token" {
  repository      = github_repository.reading_list.name
  secret_name     = "turso_auth_token"
  plaintext_value = resource.turso_database_token.preview.jwt
}

resource "github_dependabot_secret" "turso_auth_token" {
  repository      = github_repository.reading_list.name
  secret_name     = "turso_auth_token"
  plaintext_value = resource.turso_database_token.preview.jwt
}
