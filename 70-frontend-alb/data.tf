data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "public_subnet_ids_subnet_ids" {
  name = "/${var.project}/${var.environment}/public_subnet_ids"
}

data "aws_ssm_parameter" "frontend_alb_sg_id_alb_sg_id" {
  name = "/${var.project}/${var.environment}/frontend_alb_sg_id"
}
data "aws_ssm_parameter" "certificate_arn" {
  name = "/${var.project}/${var.environment}/certificate_arn"
}
