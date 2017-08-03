variable "aws_region" {
  default ="us-west-2"
}

variable "access_key" {
  description = "access_key"
}

variable "secret_key" {
  description = "secret_key"
}

//create one self signed cert and update it here
variable "ssl_certificate_id" {
  description = "Your ssl_certificate_id"
  default = "arn:aws:iam::180730306053:server-certificate/MyCertificate"
}
 
variable "elb_healthcheck_url" {
  description = "Health Check url"
  default = "HTTP:80/"
}

variable "instance_port" {
  description = "instance port"
  default = "80"
}

variable "https_instance_port" {
  description = "instance port"
  default = "8080"
}

variable "https_instance_protocol" {
  description = "instance port"
  default = "https"
}

variable "instance_protocol" {
  description = "instance protocol"
  default = "http"
}

variable "app_type" {
  description = "Application type (web or app) for the stack"
  default = ""
}

variable "app_name" {
  description = "Application Name for the stack"
  default = ""
}

variable "app_env" {
  description = "Application env for the stack"
  default = "dev"
}

variable "healthy_threshold" {
    description = "The number of checks before the instance is declared healthy."
    default = "3"
}

variable "unhealthy_threshold" {
    description = "The number of checks before the instance is declared unhealthy."
    default = "5"
}

variable "timeout" {
    description = "The length of time, in seconds, before the health check times out."
    default = "5"
}

variable "interval" {
    description = "The interval, in seconds, between health checks."
    default = "30"
}

variable "stack_name" {
	default = ""
}
variable "elb_name" {
  description = "elb_name"
  default = "sample-elb"
}

