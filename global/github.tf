data "github_user" "current" {
  username = ""
}

resource "github_repository" "infrastructure" {
  name        = "infrastructure"
  description = "A repository to manage infrastructure for my personal projects"
  topics      = ["terraform", "iac"]
}

resource "github_branch" "main" {
  repository = github_repository.infrastructure.name
  branch     = "main"
}

resource "github_branch_default" "infrastructure" {
  repository = github_repository.infrastructure.name
  branch     = github_branch.main.branch
}

resource "github_branch_protection" "require_terraform_cloud" {
  repository_id = github_repository.infrastructure.node_id

  pattern          = github_branch_default.infrastructure.branch
  allows_deletions = false

  required_status_checks {
    strict   = true
    contexts = ["Terraform Cloud/jpedroh/infrastructure"]
  }
}
