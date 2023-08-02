module "web-servers" {
  source                 = "./ec2-resources/web_servers"
  image_id               = var.web_image_id
  instance_type          = var.instance_type
  vpc_security_group_ids = ["${module.aws_security_group.SecurityGroupDetails1}", "${module.aws_security_group.SecurityGroupDetails2}"]
  subnet_id              = module.vpc.private_subnets[0]

}

# module "compute-servers" {
#   source                 = "./ec2-resources/compute_servers"
#   image_id               = var.compute_image_id
#   instance_type          = var.instance_type
#   vpc_security_group_ids = ["${module.aws_security_group.SecurityGroupDetails1}", "${module.aws_security_group.SecurityGroupDetails2}"]
#   subnet_id              = module.vpc.private_subnets[0]
# }

# module "mid-tier-servers" {
#   source                 = "./ec2-resources/mid-tier_servers"
#   image_id               = var.mid-tier_image_id
#   instance_type          = var.instance_type
#   vpc_security_group_ids = ["${module.aws_security_group.SecurityGroupDetails1}", "${module.aws_security_group.SecurityGroupDetails2}"]
#   subnet_id              = module.vpc.private_subnets[0]
# }

module "aws_security_group" {
  source = "./networking/security_group"
  ports  = var.ports
  vpc_id = module.vpc.vpc_id
}


module "vpc" {
  source = "./networking/vpc"

}





