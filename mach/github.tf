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

resource "github_branch" "master" {
  repository = github_repository.mach.name
  branch     = "master"
}

resource "github_branch_default" "mach" {
  repository = github_repository.mach.name
  branch     = github_branch.master.branch
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
