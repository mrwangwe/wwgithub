output "vpc_id" {
    value = aws_vpc.test-vpc.id
}

output "subnet_ip" {
    value = var.sum
}

output "subnet1_id" {
    value = aws_subnet.test-subnet[0].id
}

output "subnet_id" {
    value = aws_subnet.test-subnet.*.id
}