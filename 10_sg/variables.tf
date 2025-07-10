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
