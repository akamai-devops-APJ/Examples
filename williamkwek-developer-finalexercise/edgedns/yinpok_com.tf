terraform {
  required_version = ">= 0.13"
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = "~> 1.6.1"
    }
  }
}

# A provider block is used to specify a provider configuration.
provider "akamai" {
    
    # edgerc refers to the Akamai EdgeGrid authentication file that contains your Akamai API tokens. Typically ~/.edgerc.
    edgerc = "~/.edgerc"

    # config_section refers to the section inside the edgerc file which can contain multiple sets of Akamai API tokens. Typically default.
    config_section = var.edgerc_config_section
}

locals {
    zone = "yinpok.com"
}

resource "akamai_dns_zone" "yinpok_com" {
    contract = var.contractid
    group = var.groupid
    zone = local.zone
    type = "PRIMARY"
    masters = []
    comment = ""
    sign_and_serve = false
    sign_and_serve_algorithm = ""
    target = ""
    end_customer_id = ""
}


resource "akamai_dns_record" "yinpok_com_yinpok_com_NS" {
    zone = local.zone
    name = "yinpok.com"
    recordtype = "NS"
    target = ["a1-79.akam.net.", "a6-65.akam.net.", "a28-64.akam.net.", "a26-67.akam.net.", "a5-66.akam.net.", "a9-67.akam.net."]
    ttl = 86400
}

resource "akamai_dns_record" "yinpok_com_yinpok_com_SOA" {
    zone = local.zone
    email_address = "hostmaster.yinpok.com."
    expiry = 604800
    name = "yinpok.com"
    name_server = "a1-79.akam.net."
    nxdomain_ttl = 300
    recordtype = "SOA"
    refresh = 3600
    retry = 600
    target = []
    ttl = 86400
}

resource "akamai_dns_record" "yinpok_com_demo_yinpok_com_A" {
    zone = local.zone
    name = "demo.yinpok.com"
    recordtype = "A"
    target = var.demo_egress_ip
    ttl = 60
}

