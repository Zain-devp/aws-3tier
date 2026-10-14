variable "vpc_id" {
  description = "VPC ID where Security Group will be created"
  type        = string
}

variable "public_subnet_1_id" {
  description = "Public Subnet 1 ID for EC2 Instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 Instance"
  type        = string
  default     = "ami-081b0a6eac00b4f53"
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t2.micro"
}