resource "github_repository" "todos_board" {
  name = local.project_name
}

resource "github_branch" "main" {
  repository = github_repository.todos_board.name
  branch     = "main"
}

resource "github_branch_default" "todos_board" {
  repository = github_repository.todos_board.name
  branch     = github_branch.main.branch
}
