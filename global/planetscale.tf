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
