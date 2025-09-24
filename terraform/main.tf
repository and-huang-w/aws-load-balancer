
module "network" {
  source           = "../modules/network"
  vpc_cidr         = "10.0.0.0/16"
  az1a             = "us-east-1a"
  az1b             = "us-east-1b"
  subnet_az1a_cidr = "10.0.1.0/24"
  subnet_az1b_cidr = "10.0.2.0/24"
}

module "compute" {
  source            = "../modules/compute"
  ami               = "ami-00a929b66ed6e0de6"
  instance_type     = "t2.micro"
  key_name          = "vockey"
  user_data_path    = "../terraform/scripts/user_data.sh"
  vpc_id            = module.network.vpc_id
  subnet_az1a_id    = module.network.subnet_az1a_id
  subnet_az1b_id    = module.network.subnet_az1b_id
  security_group_id = module.network.security_group_id
}
