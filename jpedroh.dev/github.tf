resource "github_repository" "jpedroh_dev" {
  name      = "jpedroh.dev"
  auto_init = true
}

resource "github_branch" "main" {
  repository = github_repository.jpedroh_dev.name
  branch     = "main"
}

resource "github_branch_default" "jpedroh_dev" {
  repository = github_repository.jpedroh_dev.name
  branch     = github_branch.main.branch
}
