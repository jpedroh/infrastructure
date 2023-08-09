variable "cloudflare_account_id" {
  type      = string
}

variable "cloudflare_zone_id" {
  type      = string
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
