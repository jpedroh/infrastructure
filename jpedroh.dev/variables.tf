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

variable "github_username" {
  type = string
}
