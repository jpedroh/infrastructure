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

resource "github_actions_secret" "rpl_crawler_sentry_dsn" {
  repository      = github_repository.mach.name
  secret_name     = "rpl_crawler_sentry_dsn"
  plaintext_value = sentry_key.mach_rpl_crawler.dsn_public
}

resource "github_actions_secret" "turso_connection_url" {
  repository      = github_repository.mach.name
  secret_name     = "turso_connection_url"
  plaintext_value = "libsql://${data.turso_database.preview.hostname}"
}

resource "github_dependabot_secret" "turso_connection_url" {
  repository      = github_repository.mach.name
  secret_name     = "turso_connection_url"
  plaintext_value = "libsql://${data.turso_database.preview.hostname}"
}

resource "github_actions_secret" "turso_auth_token" {
  repository      = github_repository.mach.name
  secret_name     = "turso_auth_token"
  plaintext_value = resource.turso_database_token.preview.jwt
}

resource "github_dependabot_secret" "turso_auth_token" {
  repository      = github_repository.mach.name
  secret_name     = "turso_auth_token"
  plaintext_value = resource.turso_database_token.preview.jwt
}

resource "github_actions_secret" "turso_connection_url_production" {
  repository      = github_repository.mach.name
  secret_name     = "turso_connection_url_production"
  plaintext_value = "libsql://${data.turso_database.production.hostname}"
}

resource "github_actions_secret" "turso_auth_token_production" {
  repository      = github_repository.mach.name
  secret_name     = "turso_auth_token_production"
  plaintext_value = resource.turso_database_token.production.jwt
}
