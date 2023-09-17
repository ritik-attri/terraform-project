#Internet Gateway
resource "aws_internet_gateway" "igw_for_mumbai_vpc" {
    vpc_id = aws_vpc.mumbai_vpc.id
}
