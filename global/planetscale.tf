data "planetscale_database_branch_passwords" "production" {
  organization = local.planetscale_service_organization
  database     = local.database_name
  branch       = local.database_production_branch_name
}

data "planetscale_database_branch_passwords" "preview" {
  organization = local.planetscale_service_organization
  database     = local.database_name
  branch       = local.database_preview_branch_name
}
