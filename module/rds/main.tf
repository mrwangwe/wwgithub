locals {
    rds_tag = "${var.tag1}-${var.tag2}"
}

resource "aws_db_subnet_group" "subgrouptest" {
    name = "${local.rds_tag}-subgroup"
    subnet_ids = var.subnet_id

    tags = {
        Name = "${local.rds_tag}-subgroup"
    }
}

resource "aws_db_parameter_group" "paragrouptest" {
    name = "${local.rds_tag}-paragroup"
    family = "mysql${var.egversion}"
    description = "this is a test"

    dynamic "parameter" {
        for_each = var.parameters
        content {
            name = parameter.value.name
            value= parameter.value.value
            apply_method = "pending-reboot"
        }
    }
}

resource "aws_db_instance" "dbinstance" {
    allocated_storage = 20
    storage_type = "gp3"
    storage_encrypted = "true"
    identifier = "${local.rds_tag}-subgroup"
    db_name = "testdbinstance"
    engine = "mysql"
    engine_version = "8.0"
    instance_class = "db.t3.micro"
    username = "admin"
    password = "20032546ww"
    db_subnet_group_name = aws_db_subnet_group.subgrouptest.name
    parameter_group_name = aws_db_parameter_group.paragrouptest.name
    skip_final_snapshot = "true"

    tags = {
        Name = "${local.rds_tag}-subgroup"
    }
}
