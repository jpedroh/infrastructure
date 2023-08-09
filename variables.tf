variable "cloudflare_api_key" {
  type      = string
  sensitive = true
}

variable "cloudflare_email" {
  type      = string
  sensitive = true
}

variable "cloudflare_account" {
  type      = string
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

variable "planetscale_service_organization" {
  type      = string
}
