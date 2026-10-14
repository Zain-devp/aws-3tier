# 1. Dedicated Security Group for Auto Scaling Instances
resource "aws_security_group" "asg_sg" {
  name        = "zain_instance_tem_sg"
  description = "Security group for Auto Scaling instances"
  vpc_id      = var.vpc_id

  # Inbound Rule: HTTP Access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Inbound Rule: SSH Access
  

  # Outbound Rule: Allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "zain_instance_tem_sg"
  }
}

# 2. Launch Template
resource "aws_launch_template" "my_launch_template" {
  name_prefix   = "zain-launch-template"
  image_id      = var.ami_id
  instance_type = "t2.micro"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.asg_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ASG-Instance"
    }
  }
}
resource "aws_autoscaling_group" "my_asg" {
  name                = "zain-asg"
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = [var.public_subnet_1_id, var.public_subnet_2_id]
  target_group_arns   = [var.target_group_arn]

  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }
}