provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_elb" "elb" {
  name = "${var.elb_name}"
  availability_zones = ["us-west-2a", "us-west-2b"]
  connection_draining_timeout = 120
  cross_zone_load_balancing = true

  //create a self signed cert before creating elb
listener {
    instance_port = "${coalesce(var.https_instance_port, var.instance_port)}"
   instance_protocol = "${coalesce(var.https_instance_protocol, var.instance_protocol)}"
   lb_port = 443
   lb_protocol = "https"
   ssl_certificate_id = "${var.ssl_certificate_id}"
 }

  listener {
    instance_port = "${var.instance_port}"
    instance_protocol = "${var.instance_protocol}"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.timeout}"
    interval            = "${var.interval}"
    target = "${var.elb_healthcheck_url}"
  }
  tags {
    Name = "${var.elb_name}_elb"
    envtype = "${var.app_env}"
  }
}
