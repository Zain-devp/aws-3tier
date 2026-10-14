# output "instance_public_ip" {
#   value       = aws_instance.web_server.public_ip
#   description = "Public IP of Web Server"
# }
output "ami-id" {
  value = aws_ami_from_instance.image.id
  
}