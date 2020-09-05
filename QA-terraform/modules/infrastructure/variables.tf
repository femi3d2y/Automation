variable  "ami_id" {
}
variable "instance-type" {
}          
variable "pem-key" {
}               
variable "subnet_id" {
}              
variable "vpc_security_group_ids" {
}
variable "volume" {
}
variable "value" {
}
variable "vpc-cidr-block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "subnet-cidr-block" {
  description = "CIDR block for Public Subnet A"
  default     = "10.0.1.0/24"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80, 443]
}