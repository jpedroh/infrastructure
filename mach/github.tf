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
