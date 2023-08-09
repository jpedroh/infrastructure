resource "cloudflare_record" "reading_list" {
  zone_id = var.cloudflare_zone_id
  name    = "reading-list"
  value   = "cname.vercel-dns.com"
  type    = "CNAME"
  ttl     = 3600
  proxied = false
}
