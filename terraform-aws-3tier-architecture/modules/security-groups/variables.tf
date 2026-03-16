variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "admin_ip" {
  description = "Admin IP for SSH"
  type        = list(string)
}
