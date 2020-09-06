module "vpc" {
    source                 = "./VPC"
    vpc-cidr-block         = var.vpc-cidr-block
    subnet-cidr-block      = var.subnet-cidr-block

}

module "securitygroup" {
    source                 = "./SecurityGroups"
    security-group-name    = var.security-group-name
    ingress_ports          = var.ingress_ports
    outbound-port          = var.outbound-port
    open-internet          = var.open-internet
    vpc_id                 = module.vpc.aws_vpc.id
}



module "ec2" {
    source                 = "./ec2"
    ami_id                 = var.ami_id
    instance-type          = var.instance-type
    pem-key                = var.pem-key
    subnet_id              = var.subnet_id
    vpc_security_group_ids = aws_security_group.security-group.id
    volume                 = var.volume
    value                  = var.value
}

