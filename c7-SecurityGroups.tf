resource "aws_security_group" "testingVPC-SG" {
    vpc_id = aws_vpc.mumbai_vpc.id
    description = "Default SG for testing VPC"
    ingress {
        description = "Allow port 22"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "Allow port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "Allow all ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}