provider "aws" {
  region = "${var.aws_region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_launch_configuration" "launch_config" {
  name_prefix   = "lc-sample"
  image_id = "${var.ec2_machine_image}"
  instance_type = "t2.micro"
  key_name = "${var.ec2_user_login_key}"
  user_data = "${file("userdata.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "bar" {
  name                 = "asg-sample"
  availability_zones   = ["us-west-2a"]
  launch_configuration = "${aws_launch_configuration.launch_config.name}"
  min_size             = 1
  max_size             = 2
  load_balancers = ["${split(",", var.load_balancer_names)}"]
  
  lifecycle {
    create_before_destroy = true
  }
  }
