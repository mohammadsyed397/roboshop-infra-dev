variable "sg_description" {
      default = "This security group is for frontend"  
}
variable "sg_name" {
    default = "front-end-securitygroup"
}
variable "project" {
    default = "roboshop"
}
variable "environment" {
    default = "dev"
}
variable "bastion_sg_name" {
    default = "bastion_security_group"
}
variable "bastion_sg_description" {
    default = "this security group is for security group"
}
variable "mongodb_ports_vpn" { # just keep as mongodb_ports
    default = [22, 27017]
}

variable "redis_ports_vpn" {
    default = [22, 6379]
}

variable "mysql_ports_vpn" {
    default = [22, 3306]
}

variable "rabbitmq_ports_vpn" {
    default = [22, 5672]
}