resource "vercel_project" "mach" {
  name      = local.project_name
  framework = "nextjs"
  git_repository = {
    production_branch = github_branch_default.mach.branch
    repo              = github_repository.mach.full_name
    type              = "github"
  }
  build_command    = "nx run @mach/app:build"
  output_directory = "packages/app/.next"
}

resource "vercel_project_environment_variable" "database_host_preview" {
  project_id = vercel_project.mach.id
  key        = "DATABASE_HOST"
  value      = var.database_host_preview
  target     = ["preview"]
}

resource "vercel_project_environment_variable" "database_username_preview" {
  project_id = vercel_project.mach.id
  key        = "DATABASE_USERNAME"
  value      = var.database_username_preview
  target     = ["preview"]
}

resource "vercel_project_environment_variable" "database_password_preview" {
  project_id = vercel_project.mach.id
  key        = "DATABASE_PASSWORD"
  value      = var.database_password_preview
  target     = ["preview"]
}
