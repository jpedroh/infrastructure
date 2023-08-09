resource "github_repository" "reading_list" {
  name          = local.project_name
  description   = "A personal reading list to save interesting articles regarding Software Engineering."
  has_downloads = true
  has_issues    = true
  has_projects  = true
  has_wiki      = true
  homepage_url  = "https://reading-list.jpedroh.dev"
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

resource "github_actions_secret" "database_host" {
  repository      = github_repository.reading_list.name
  secret_name     = "database_host"
  plaintext_value = var.database_host_preview
}

resource "github_actions_secret" "database_username" {
  repository      = github_repository.reading_list.name
  secret_name     = "database_username"
  plaintext_value = var.database_username_preview
}

resource "github_actions_secret" "database_password" {
  repository      = github_repository.reading_list.name
  secret_name     = "database_password"
  plaintext_value = var.database_password_preview
}

resource "github_actions_secret" "database_url" {
  repository      = github_repository.reading_list.name
  secret_name     = "database_url"
  plaintext_value = var.database_url_preview
}
