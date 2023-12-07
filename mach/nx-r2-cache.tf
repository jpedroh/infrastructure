resource "cloudflare_r2_bucket" "nx_cache_bucket" {
  account_id = var.cloudflare_account.id
  name       = "${local.project_name}-nx-cache"
}

resource "aws_s3_bucket_lifecycle_configuration" "life_cycles" {
  bucket = cloudflare_r2_bucket.nx_cache_bucket.id
  rule {
    id = "expire-bucket"
    status = "Enabled"
    expiration {
      days = 7
    }
  }
  rule {
    id = "abort-multipart-upload"
    status = "Enabled"
    abort_incomplete_multipart_upload {
      days_after_initiation = 1
    }
  }
}
