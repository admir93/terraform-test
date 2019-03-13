data "aws_route53_zone" "selected" {
  name         = "hotreboot.com."
  private_zone = false
}

resource "aws_route53_record" "admir-app" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "admir-app.${data.aws_route53_zone.selected.name}"
  type    = "A"

  alias {
      name = "${var.elb_dns_name}"
      zone_id = "${var.elb_zone_id}"
      evaluate_target_health = false
  }
}