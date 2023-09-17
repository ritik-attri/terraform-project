data "aws_region" "current" {}

resource "aws_vpc_ipam" "test" {
  operating_regions {
    region_name = data.aws_region.current.name
  }
}

resource "aws_vpc_ipam_pool" "test" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.test.private_default_scope_id
  locale         = data.aws_region.current.name
}

resource "aws_vpc_ipam_pool_cidr" "test" {
  ipam_pool_id = aws_vpc_ipam_pool.test.id
  cidr         = "10.0.0.0/16"
}

resource "aws_vpc" "mumbai_vpc" {
    ipv4_ipam_pool_id   = aws_vpc_ipam_pool.test.id
    ipv4_netmask_length = 16
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "Terraform-FSD-Project"
    }
}