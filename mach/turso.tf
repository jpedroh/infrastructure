data "turso_database" "production" {
    organization_name = "jpedroh"
    name = "mach"
}

resource "turso_database_token" "production" {
    organization_name = data.turso_database.production.organization_name
    database_name = data.turso_database.production.name
}

data "turso_database" "preview" {
    organization_name = "jpedroh"
    name = "mach-dev"
}

resource "turso_database_token" "preview" {
    organization_name = data.turso_database.preview.organization_name
    database_name = data.turso_database.preview.name
}
