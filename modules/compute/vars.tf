variable "ami" {
	description = "AMI para instâncias EC2"
	type        = string
}

variable "instance_type" {
	description = "Tipo da instância EC2"
	type        = string
}

variable "key_name" {
	description = "Nome da chave SSH EC2"
	type        = string
}

variable "user_data_path" {
	description = "Caminho do script de user_data"
	type        = string
}

variable "vpc_id" {
	description = "ID da VPC"
	type        = string
}

variable "subnet_az1a_id" {
	description = "ID da subnet AZ1a"
	type        = string
}

variable "subnet_az1b_id" {
	description = "ID da subnet AZ1b"
	type        = string
}

variable "security_group_id" {
	description = "ID do security group"
	type        = string
}