terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
    sentry = {
      source = "jianyuan/sentry"
      version = "~> 0.9"
    }
    aws = {
      source = "hashicorp/aws"
      version = "~> 4"
    }
    turso = {
      source = "jpedroh/turso"
      version = "0.2.0"
    }
  }
}
