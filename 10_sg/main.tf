module "frontend" {
    source = "git::https://github.com/mohammadsyed397/terraform-aws-securitygroup.git?ref=main"
    sg_description = var.sg_description
    sg_name = var.sg_name
    project = var.project
    environment = var.environment
    vpc_id = local.vpc_id

  
}