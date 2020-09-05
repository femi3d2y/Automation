output "vpc_id" {
  value = aws_vpc.new_vpc.id
}

output "public_subnetA_id" {
  value = aws_subnet.publicA.id
}
