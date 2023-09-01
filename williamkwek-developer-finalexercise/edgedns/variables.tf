variable "contractid" {
    default = "V-434SAU2"
}

variable "groupid" {
    default = ""
}

variable "edgerc_config_section" {
    default = "default"
}

variable "demo_egress_ip" {
    type = list(string)
    default = ["2.2.2.2"]
}