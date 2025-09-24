variable "vpc_cidr" {
  description = "CIDR block da VPC"
  type        = string
  validation {
    condition     = can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpc_cidr))
    error_message = "O CIDR da VPC deve estar no formato correto, por exemplo: 10.0.0.0/16"
  }
}

variable "az1a" {
  description = "Availability Zone 1a"
  type        = string
}

variable "az1b" {
  description = "Availability Zone 1b"
  type        = string
}

variable "subnet_az1a_cidr" {
  description = "CIDR da subnet AZ1a"
  type        = string
}

variable "subnet_az1b_cidr" {
  description = "CIDR da subnet AZ1b"
  type        = string
}