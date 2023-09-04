resource "planetscale_database" "main" {
  organization = local.planetscale_service_organization
  name         = local.database_name
  region       = local.database_region
  notes        = ""
}

resource "planetscale_database_branch" "production" {
  organization  = planetscale_database.main.organization
  database      = planetscale_database.main.name
  name          = local.database_production_branch_name
  region        = local.database_region
  parent_branch = null
}

resource "planetscale_database_branch" "preview" {
  organization  = planetscale_database.main.organization
  database      = planetscale_database.main.name
  name          = local.database_preview_branch_name
  region        = local.database_region
  parent_branch = planetscale_database_branch.production.name
}

resource "planetscale_database_branch_password" "production" {
  organization = planetscale_database.main.organization
  database     = planetscale_database.main.name
  branch       = planetscale_database_branch.production.name
  name         = "${local.database_production_branch_name}-terraform"
}

resource "planetscale_database_branch_password" "preview" {
  organization = planetscale_database.main.organization
  database     = planetscale_database.main.name
  branch       = planetscale_database_branch.preview.name
  name         = "${local.database_preview_branch_name}-terraform"
}
