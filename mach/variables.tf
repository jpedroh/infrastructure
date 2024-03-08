variable "cloudflare_account" {
  type = object({
    id = string
  })
}

variable "cloudflare_zone" {
  type = object({
    id   = string
    zone = string
  })
}

variable "aisweb_api_key" {
  type      = string
  sensitive = true
}

variable "aisweb_api_password" {
  type      = string
  sensitive = true
}

variable "github_username" {
  type = string
}

variable "sentry_auth_token" {
  type      = string
  sensitive = true
}

variable "sentry_organization_slug" {
  type = string
}

variable "sentry_team_slug" {
  type = string
}

variable "cloudflare_r2_access_key_id" {
  type      = string
  sensitive = true
}

variable "cloudflare_r2_secret_access_key" {
  type      = string
  sensitive = true
}

variable "posthog_key" {
  type       = string
  sensitive = true
}

variable "turso_mach_token" {
  type       = string
  sensitive = true
}

variable "turso_mach_preview_token" {
  type       = string
  sensitive = true
}
