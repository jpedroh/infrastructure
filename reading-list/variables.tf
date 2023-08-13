variable "cloudflare_account" {
  type = object({
    id = string
  })
}

variable "cloudflare_zone" {
  type = object({
    id = string
    zone = string
  })
}

variable "otp_secret_production" {
  type      = string
  sensitive = true
}

variable "otp_secret_dev_preview" {
  type      = string
  sensitive = true
}

variable "database_host_production" {
  type      = string
  sensitive = true
}

variable "database_username_production" {
  type      = string
  sensitive = true
}

variable "database_password_production" {
  type      = string
  sensitive = true
}

variable "database_url_production" {
  type      = string
  sensitive = true
}

variable "database_host_preview" {
  type      = string
  sensitive = true
}

variable "database_username_preview" {
  type      = string
  sensitive = true
}

variable "database_password_preview" {
  type      = string
  sensitive = true
}

variable "database_url_preview" {
  type      = string
  sensitive = true
}

variable "github_username" {
  type = string
}

variable "sentry_organization_slug" {
  type      = string
  sensitive = true
}
