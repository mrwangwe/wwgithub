variable "region" {
    type = string
    default = "cn-northwest-1"
}

variable "tag1" {
    default = "gehc-709"
}
variable "tag2" {
    default = "test"
}

variable "subnet_id" {}

variable "zone" {
    default = ["cn-northwest-1a","cn-northwest-1b"]
}
variable "egversion" {
    default = "8.0"
}
variable "parameters" {
    type = list(map(string))
    default = [
        { name = "max_allowed_packet", value = "104857600" },
        { name = "lower_case_table_names", value = "1" },
        { name = "time_zone", value = "Asia/Shanghai" },
        { name = "log_bin_trust_function_creators", value = "1" },
        { name = "max_connect_errors", value = "1000" }
    ]
}