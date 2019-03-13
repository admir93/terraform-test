# Define ELB
resource "aws_elb" "elb-test" {
    name = "ELB-admir-${var.environment}-${var.project}"
    subnets = ["${var.public_subnet_ids}"]

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 443
        lb_protocol = "https"
        ssl_certificate_id = "${var.acm_ssl_id}"
    }

    health_check {
        healthy_threshold  = 2
        unhealthy_threshold  = 2
        timeout = 5
        target = "HTTP:80/"
        interval = 30
    }
    security_groups = ["${var.sgids}"]
    #instances = ["${var.ec2_ids}"]
    cross_zone_load_balancing = true
    idle_timeout = 400
    connection_draining = true
    connection_draining_timeout = 400

    tags = {
        Name = "ELB-${var.environment}-${var.project}"
    }

      

}