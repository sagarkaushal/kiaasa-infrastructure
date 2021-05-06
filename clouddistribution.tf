# CREATE CLOUDFRONT DISTRIBUTION
locals {
  kiaasa_development_origin_id = "kiaasa-development-origin"

}

resource "aws_cloudfront_distribution" "kiaasa-development-distribution" {
  origin {
    domain_name = aws_lb.kiaasa-development-load-balancer.dns_name
    origin_id   = local.kiaasa_development_origin_id
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1"]

    }
  }
  enabled         = true
  is_ipv6_enabled = true
  comment         = "kiaasa-development-cloudfront-distribution"
  aliases         = ["cdndev.kiaasa.shop"]
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.kiaasa_development_origin_id
    forwarded_values {
      query_string = false
      headers      = ["host", "origin", "Access-Control-Request-Headers", "Access-Control-Request-Method"]
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  price_class = "PriceClass_All"
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = false
    ssl_support_method             = "sni-only"
    acm_certificate_arn            = "arn:aws:acm:us-east-1:636177926524:certificate/8055f54b-a756-4ba1-8fdf-d49dcb524e55"
    minimum_protocol_version       = "TLSv1.2_2018"
  }
}