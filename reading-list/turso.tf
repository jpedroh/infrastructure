resource "turso_database" "production" {
    organization_name = "jpedroh"
    name = "reading-list"
    group = "default"
}

resource "turso_database_token" "production" {
    organization_name = "jpedroh"
    database_name = "reading-list"
}
