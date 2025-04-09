resource "cloudflare_workers_script" "mach" {
  account_id = var.cloudflare_account.id
  script_name = local.project_name
  bindings = [
    {
        name = "TURSO_CONNECTION_URL"
        type = "plain_text",
        text = "libsql://${data.turso_database.production.hostname}"
    }, 
    {
        name = "TURSO_AUTH_TOKEN"
        type = "secret_text",
        text = resource.turso_database_token.production.jwt
    }
  ]
}