module "vpc" {
  source         = "../../modules/vpc"
  cidr_block     = "10.0.0.0/16"
  public_subnet  = "10.0.1.0/24"
  private_subnet = "10.0.2.0/24"
}

module "alb" {
  source  = "../../modules/alb"
  vpc_id  = module.vpc.vpc_id
  subnets = [module.vpc.public_subnet_id]
}

module "asg" {
  source           = "../../modules/asg"
  ami              = "ami-0f5ee92e2d63afc18"
  instance_type    = "t2.micro"
  subnets          = [module.vpc.private_subnet_id]
  target_group_arn = module.alb.target_group_arn
}
