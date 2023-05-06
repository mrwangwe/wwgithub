resource "aws_instance" "test-instance" {
    ami	= "ami-067c3d59aa0bcc740"
    instance_type = "t3a.micro"
    key_name = "zabbix"
    subnet_id = var.subnet1_id
    vpc_security_group_ids = [var.sg_id]
    iam_instance_profile = var.ec2role

    credit_specification {
        cpu_credits = "standard"
    }

    tags = {
        Name = "gehc-709-test-instance"
    }
}