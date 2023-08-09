resource "vercel_project" "reading_list" {
  name      = local.project_name
  framework = "nextjs"
  git_repository = {
    production_branch = github_branch_default.reading_list.branch
    repo              = github_repository.reading_list.full_name
    type              = "github"
  }
}

resource "vercel_project_domain" "reading_list" {
  project_id = vercel_project.reading_list.id
  domain     = cloudflare_record.reading_list.hostname
}

resource "vercel_project_environment_variable" "otp_secret_production" {
  project_id = vercel_project.reading_list.id
  key        = "OTP_SECRET"
  value      = var.otp_secret_production
  target     = ["production"]
}

resource "vercel_project_environment_variable" "otp_secret_dev_preview" {
  project_id = vercel_project.reading_list.id
  key        = "OTP_SECRET"
  value      = var.otp_secret_dev_preview
  target     = ["development", "preview"]
}

resource "vercel_project_environment_variable" "database_host_production" {
  project_id = vercel_project.reading_list.id
  key        = "DATABASE_HOST"
  value      = var.database_host_production
  target     = ["production"]
}

resource "vercel_project_environment_variable" "database_username_production" {
  project_id = vercel_project.reading_list.id
  key        = "DATABASE_USERNAME"
  value      = var.database_username_production
  target     = ["production"]
}

resource "vercel_project_environment_variable" "database_password_production" {
  project_id = vercel_project.reading_list.id
  key        = "DATABASE_PASSWORD"
  value      = var.database_password_production
  target     = ["production"]
}

resource "vercel_project_environment_variable" "database_host_preview" {
  project_id = vercel_project.reading_list.id
  key        = "DATABASE_HOST"
  value      = var.database_host_preview
  target     = ["preview"]
}

resource "vercel_project_environment_variable" "database_username_preview" {
  project_id = vercel_project.reading_list.id
  key        = "DATABASE_USERNAME"
  value      = var.database_username_preview
  target     = ["preview"]
}

resource "vercel_project_environment_variable" "database_password_preview" {
  project_id = vercel_project.reading_list.id
  key        = "DATABASE_PASSWORD"
  value      = var.database_password_preview
  target     = ["preview"]
}

resource "vercel_project_environment_variable" "otp_user" {
  project_id = vercel_project.reading_list.id
  key        = "OTP_USER"
  value      = local.otp_user
  target     = ["production", "development", "preview"]
}

resource "vercel_project_environment_variable" "otp_service" {
  project_id = vercel_project.reading_list.id
  key        = "OTP_SERVICE"
  value      = local.otp_service
  target     = ["production", "development", "preview"]
}
