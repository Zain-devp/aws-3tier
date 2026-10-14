provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source = "./VPC"
}
module "ec2" {
  source             = "./EC2"
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
}
module "s3" {
  source = "./S3"
}
module "alb" {
  source             = "./ALB"
  vpc_id             = module.vpc.vpc_id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
}
module "autoscaling" {
  source             = "./AutoScaling"
  vpc_id             = module.vpc.vpc_id
  ami_id             = module.ec2.ami-id
  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id
  target_group_arn   = module.alb.target_group_arn
}