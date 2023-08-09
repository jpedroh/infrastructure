resource "cloudflare_record" "mach" {
  zone_id = var.cloudflare_zone_id
  name    = local.project_name
  value   = "cname.vercel-dns.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}
