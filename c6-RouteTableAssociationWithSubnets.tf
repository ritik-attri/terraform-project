resource "aws_route_table_association" "testingvpc-public-subnet-routes-assoication" {
    subnet_id = aws_subnet.testingvpc-public-subnet.id
    route_table_id = aws_route_table.testingvpc-public-subnet-routes.id
}

resource "aws_route_table_association" "testingvpc-private-subnet-routes-association" {
    subnet_id = aws_subnet.testingvpc-private-subnet.id
    route_table_id =  aws_route_table.testingvpc-private-subnet-routes.id
}