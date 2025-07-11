resource "aws_instance" "mongodb" {
    ami = local.ami_id
    vpc_security_group_ids = [local.mongodb_sg_id]
    subnet_id = local.database_subnet_id
    instance_type = "t3.micro"
    tags = merge (
        local.common_tags,{
            Name =  "${var.project}-${var.environment}-mongodb"

        }
        
        
    )
}
