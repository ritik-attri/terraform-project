#Subnets
resource "aws_subnet" "testingvpc-public-subnet" {
    vpc_id = aws_vpc.mumbai_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "testingvpc-private-subnet" {
    vpc_id = aws_vpc.mumbai_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "ap-south-1b"
}