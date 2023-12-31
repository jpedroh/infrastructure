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
    planetscale = {
      source  = "koslib/planetscale"
      version = "~> 0.7.0"
    }
    sentry = {
      source = "jianyuan/sentry"
      version = "~> 0.9"
    }
  }
}
