resource "aws_nat_gateway" "Public-Subnet-Nat" {
  connectivity_type = "public"
  allocation_id = aws_eip.EIP-NAT-Gateway.id
  subnet_id = aws_subnet.testingvpc-public-subnet.id
  depends_on = [aws_internet_gateway.igw_for_mumbai_vpc, aws_eip.EIP-NAT-Gateway]
}