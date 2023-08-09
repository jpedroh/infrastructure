data "planetscale_database_branch_passwords" "production" {
    organization = var.planetscale_service_organization
    database = "mach"
    branch = "main"
}

data "planetscale_database_branch_passwords" "preview" {
    organization = var.planetscale_service_organization
    database = "mach"
    branch = "preview"
}
