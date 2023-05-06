variable "name" {
    default = "gehc-709-test"
}

variable "vpc_id" {}

variable "testport" {
    default = ["22","21","80","443"]
}

variable "all_ips" {
    default = ["0.0.0.0/0"]
}

variable "subnet_ip" {}
