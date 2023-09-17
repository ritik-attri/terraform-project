resource "aws_route_table" "testingvpc-public-subnet-routes" {
    vpc_id = aws_vpc.mumbai_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_for_mumbai_vpc.id
    }
}

resource "aws_route_table" "testingvpc-private-subnet-routes" {
    vpc_id = aws_vpc.mumbai_vpc.id
}