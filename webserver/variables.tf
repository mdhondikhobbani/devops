variable "aws_region" {
  default = "us-west-2"
}
variable "access_key" {
  description = "access_key"
}

variable "secret_key" {
  description = "secret_key"
}

variable "ec2_machine_image" {
  description = "The AMI to use"
  default = "ami-6f68cf0f"
}

variable "load_balancer_names" {
  description = "Load Balancer that should atttached to this ASG"
  default = "sample-elb"
}

variable "ec2_user_login_key" {
  description = "The Pem key that need to"
  default = "mykey1"
}
