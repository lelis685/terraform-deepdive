# --- root ---

variable "aws_region" {
  default = "us-east-1"
}

variable "access_ip" {
  type = string
}

# database variables

variable "dbuser" {
  type      = string
  sensitive = true
}

variable "dbpassword" {
  type      = string
  sensitive = true
}

variable "dbname" {
  type = string
}

variable "public_key_path" {
  type = string
}

variable "token" {
  type = string
}


