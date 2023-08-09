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

variable "vercel_api_token" {
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
