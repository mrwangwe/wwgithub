variable "region" {
    type = string
    default = "cn-northwest-1"
}

variable "cidr" {
    type = string
    default = "192.168.186.0/24"
}


variable "name" {
    type = string
    default = "gehc-709-test"
}

variable "sum" {
    type = list(string)
    default = ["192.168.186.0/25","192.168.186.240/28"]
}

variable "zone" {
    default = ["cn-northwest-1a","cn-northwest-1b"]
}