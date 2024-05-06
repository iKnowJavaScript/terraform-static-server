# WAF Web ACL
resource "aws_wafv2_web_acl" "web_acl" {
  name        = "${var.name}-waf"
  description = "WAF ACL for ${var.name} CloudFront distribution"
  scope       = "CLOUDFRONT"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.name}-web-acl-metric"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "AWS-AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
        rule_action_override {
          name = "SizeRestrictions_BODY"
          action_to_use {
            count {}
          }
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-AWSManagedRulesCommonRuleSet"
      sampled_requests_enabled   = true
    }
  }
}

# Associate the WAF Web ACL with the CloudFront distribution
# resource "aws_wafv2_web_acl_association" "waf_assoc" {
#   resource_arn = aws_cloudfront_distribution.static_content_distribution.web_acl_id
#   web_acl_arn  = aws_wafv2_web_acl.web_acl.arn
# }
