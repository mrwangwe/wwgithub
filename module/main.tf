module "testvpc" {
    source = "./vpc"
} 

module "testsg" {
    source = "./security_group"
    vpc_id = module.testvpc.vpc_id
    subnet_ip = module.testvpc.subnet_ip
}

module "testinstance" {
    source = "./instance"
    subnet1_id = module.testvpc.subnet1_id
    sg_id = module.testsg.sg_id
}

module "testrds" {
    source = "./rds"
    subnet_id = module.testvpc.subnet_id
}