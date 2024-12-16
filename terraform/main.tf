module "dev" {
  source = "./infra"
  env = "dev"
  instance_type = "t2.micro"
  instance_count = 1
  ami = "ami-0e9085e60087ce171"
  instance_volume_size = 10
}

module "stg" {
  source = "./infra"
  env = "stg"
  instance_type = "t2.micro"
  instance_count = 1
  ami = "ami-0e9085e60087ce171"
  instance_volume_size = 10
}

output "dev_infra_ec2_public_ips" {
  value = module.dev.ec2_public_ips
}

output "stg_infra_ec2_public_ips" {
  value = module.stg.ec2_public_ips
}
