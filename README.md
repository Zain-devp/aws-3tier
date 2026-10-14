AWS 3-Tier Architecture using Terraform (Modular)

This repository contains Terraform code to deploy a highly available and scalable 3-Tier Architecture on AWS using modular structure.

Architecture Overview
- VPC Module: Custom VPC, Public and Private Subnets across multiple Availability Zones, Internet Gateway, and Route Tables.
- Compute and AutoScaling Module: Auto Scaling Group with EC2 instances running inside private and public subnets.
- Load Balancing Module: Application Load Balancer to distribute incoming web traffic across instances.
- Storage Module: Amazon S3 bucket for object storage.

Repository Structure
├── ALB/           # Application Load Balancer module
├── AutoScaling/   # Auto Scaling Group module
├── EC2/           # Elastic Compute Cloud module
├── S3/            # Simple Storage Service module
├── VPC/           # Virtual Private Cloud module
├── main.tf        # Root Terraform configuration
├── variable.tf    # Input variables
├── output.tf      # Output values
└── .gitignore     # Git ignore file for state files

How to Use
1. Clone the repository:
   git clone https://github.com/Zain-devp/zain-devops-.git
2. Initialize Terraform:
   terraform init
3. Plan infrastructure:
   terraform plan
4. Apply infrastructure:
   terraform apply
