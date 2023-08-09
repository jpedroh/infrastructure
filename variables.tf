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
