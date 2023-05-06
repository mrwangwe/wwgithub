resource "aws_security_group" "test-sg" {
    name = "${var.name}-sg"
    vpc_id = var.vpc_id

    tags = {
        Name = "${var.name}-sg"
    }
}

resource "aws_security_group_rule" "test-rule" {
    count = length(var.testport)
    type = "ingress"
    from_port = element(var.testport,count.index)
    to_port = element(var.testport,count.index)
    protocol = "tcp"
    cidr_blocks = var.subnet_ip
    security_group_id = aws_security_group.test-sg.id
    depends_on = [aws_security_group.test-sg]
}

resource "aws_security_group_rule" "test1-rule" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.all_ips
    security_group_id = aws_security_group.test-sg.id
    depends_on = [aws_security_group.test-sg]
}