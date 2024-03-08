variable "cloudflare_api_key" {
  type      = string
  sensitive = true
}

variable "cloudflare_email" {
  type      = string
  sensitive = true
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "planetscale_service_token_id" {
  type      = string
  sensitive = true
}

variable "planetscale_service_token" {
  type      = string
  sensitive = true
}

variable "otp_secret_production" {
  type      = string
  sensitive = true
}

variable "otp_secret_dev_preview" {
  type      = string
  sensitive = true
}

variable "aisweb_api_key" {
  type      = string
  sensitive = true
}

variable "aisweb_api_password" {
  type      = string
  sensitive = true
}

variable "sentry_token" {
  type      = string
  sensitive = true
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

variable "turso_reading_list_token" {
  type       = string
  sensitive = true
}

variable "turso_reading_list_preview_token" {
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

