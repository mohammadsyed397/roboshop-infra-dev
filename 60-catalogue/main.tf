resource "aws_lb_target_group" "catalogue" {
  name        = "${var.project}-${var.environment}-catalogue"
  port        = 8080
  protocol    = "http"
  vpc_id      = local.vpc_id
  health_check {
    healthy_threshold = 2
    interval = 5
    path = "/health"
    matcher = "200-299"
    port = 8080
    timeout = 2
    unhealthy_threshold = 3

  }
}
resource "aws_instance" "catalogue" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = local.catalogue_sg_id
    subnet_id = local.private_subnet_ids
    tags = merge (
        local.common_tags,{
        Name = "${var.project}-${var.environment}-catalogue"
        }
    )
    
}
resource "terraform_data" "catalogue" {
    triggers_replace = [
        aws_instance.catalogue.id
    ]
    provisioner "file" {
        source = "catalogue.sh"
        destination = "/tmp/catalogue.sh"
      
    }
    connection {
        type = "ssh"
        port = 22
        user = "ec2-user"
        password = "DevOps321"
        host = aws_instance.catalogue.private_ip
      
    }
    provisioner "remote-exec" {
        inline = [ 
            "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh catalogue ${var.environment}"
    ]
         
      
    }
  
}