
resource "aws_instance" "vpn" {
    ami = local.ami_id
    vpc_security_group_ids = [local.vpn_sg_id]
    subnet_id = local.public_subnet_id
    instance_type = "t3.micro"
    key_name = "king"
    user_data = file("openvpn.sh")
    tags = merge (
        local.common_tags,{
            Name =  "${var.project}-${var.environment}-vpn"

        }
        
        
    )
}
resource "aws_route53_record" "vpn" {
    name = "${var.environment}.${var.zone_name}"
    type = "A"
    zone_id = var.zone_id
    ttl = 1
    records = [aws_instance.vpn.public_ip]
    allow_overwrite = true
}