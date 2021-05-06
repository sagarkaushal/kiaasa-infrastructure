#Create Domain Record for the portal  ALB


resource "aws_route53_record" "www-record" {
    zone_id = 
    name = "www.kiaasa.shop"
    type = "A"
    alias {
        name = aws_lb.kiaasa-development-load-balancer.dns_name
        zone_id = aws_lb.kiaasa-development-load-balancer.zone_id
        evaluate_target_health = false
    }
}

# Create Domain Record for CDN


resource "aws_route53_record" "cdn-record" {
    zone_id = 
    name = "cdndev.kiaasa.shop"
    type = "A"
    alias {
        name = aws_cloudfront_distribution.kiaasa-development-distribution.domain_name
        zone_id = aws_cloudfront_distribution.kiaasa-development-distribution.hosted_zone_id
        evaluate_target_health = false
    }
}