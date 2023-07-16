# --- networking ---

variable "vpc_cidr" {
  type = string
}

variable "public_cidrs" {
  type = list(string)
}


variable "private_cidrs" {
  type = list(string)
}

variable "public_subnet_count" {
  type = number
}

variable "private_subnet_count" {
  type = number
}

variable "max_subnets" {
  type = number
}

variable "access_ip" {
  type = string
}

variable "security_groups" {}