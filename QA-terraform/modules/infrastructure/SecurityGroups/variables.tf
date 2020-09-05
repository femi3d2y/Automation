variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22, 80, 443]
}

variable "name" {
  description = "Name of security group"

}

variable "vpc_id" {
  description = "VPC id" 
}


variable "outbound-port" {
  description = "open all outbound ports"
  default     = 0
}


variable "open-internet" {
  description = "Allow all connections"
  default     = ["0.0.0.0/0"]

}
