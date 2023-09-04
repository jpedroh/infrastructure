resource "planetscale_database" "main" {
  organization = local.planetscale_service_organization
  name         = local.database_name
  region       = local.database_region
  notes        = ""
}

resource "planetscale_database_branch_password" "production" {
  organization = local.planetscale_service_organization
  database     = local.database_name
  branch       = local.database_production_branch_name
  name         = "${local.database_production_branch_name}-terraform"
}

resource "planetscale_database_branch_password" "preview" {
  organization = local.planetscale_service_organization
  database     = local.database_name
  branch       = local.database_preview_branch_name
  name         = "${local.database_preview_branch_name}-terraform"
}
