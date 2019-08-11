resource "aws_s3_bucket" "moonshot" {
  bucket = "moonshot-bucket"
  acl    = "public-read"

  tags = {
    Name        = "My bucket"
    Environment = "Prod"
  }
lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      "rule"      = "log"
      "autoclean" = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
#Version Enabled for S3

  versioning {
    enabled = true
  }

	lifecycle_rule {
	    prefix  = "config/"
	    enabled = true

	    noncurrent_version_transition {
	    days          = 30
	    storage_class = "STANDARD_IA"
	    }

	    noncurrent_version_transition {
	    days          = 60
	    storage_class = "GLACIER"
   	    }

	    noncurrent_version_expiration {
	    days = 90
	    }
}
}
