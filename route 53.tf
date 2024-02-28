resource "aws_route53_record" "cloudfront_record" {
  zone_id = "Z0804944375KWXIC7X506"  # Replace with your Route 53 hosted zone ID
  name    = "${var.domain_name}"           # Replace with the desired DNS name
  type    = "A"

  alias {
    name                   = "${aws_cloudfront_distribution.s3_distribution.domain_name}" 
    zone_id                = "Z2FDTNDATAQYW2"                              
    evaluate_target_health = false
  }
}
