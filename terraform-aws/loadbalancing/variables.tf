# --- loadbalancing ---

variable "public_sg" {}
variable "public_subnets" {}
variable "tg_port" {}
variable "tg_protocol" {}
variable "vpc_id" {}
variable "elb_healthy_threshold" {}
variable "elb_unhealthy_threshold" {}
variable "elb_timeout" {}
variable "elb_interval" {}
variable "listener_port" {}
variable "listener_protocol" {}
