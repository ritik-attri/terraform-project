data "aws_ami" "ec2-instance-ami-id" {
    most_recent = true
    filter {
        name = "name"
        values = ["al2023-ami-2023.*-x86_64"]
    }
}
# Prod
resource "aws_instance" "testing-vpc-bastion-instance" {
    ami = data.aws_ami.ec2-instance-ami-id.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.testingvpc-public-subnet.id
    key_name = "terraform-key"
    availability_zone = "ap-south-1a"
	#user_data = file("apache-install.sh")
    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
        echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
        EOF  
    vpc_security_group_ids = [ aws_security_group.testingVPC-SG.id ]
    tags = {
      "name" = "Prod-prod-instance"
    }
}
# Dev and Qa
resource "aws_instance" "testing-vpc-instances" {
    for_each = {
        dev = "dev-instance"
        qa = "qa-instance"
    }
    ami = data.aws_ami.ec2-instance-ami-id.id
    instance_type = "t2.micro"
    subnet_id = aws_subnet.testingvpc-private-subnet.id
    availability_zone = "ap-south-1b"
    user_data = <<-EOF
        #!/bin/bash
        sudo yum update -y
        sudo yum install httpd -y
        sudo systemctl enable httpd
        sudo systemctl start httpd
        echo "<h1>Welcome to StackSimplify ! AWS Infra created using Terraform in us-east-1 Region</h1>" > /var/www/html/index.html
        EOF  
    vpc_security_group_ids = [ aws_security_group.testingVPC-SG.id ]
    tags = {
      "name" = "${each.key}-${each.value}"
    }
}