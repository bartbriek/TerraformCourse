provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "BartTerraform-EC2-t2-micro" {
    ami = "ami-0fc970315c2d38f01"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.instance.id]

    user_data = <<-EOF
                #!/bin/bash
                echo "Hello, World" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
    
    tags = {
      "Name" = "Bart's awesome EC2"
    }
}

resource "aws_security_group" "instance" {
    name = "BartTerraform-EC2-t2-micro-security-group"

    ingress = [{
        description = ""
        from_port     = 8080
        to_port       = 8080
        protocol      = "tcp"
        cidr_blocks   = ["0.0.0.0/0"]
        security_groups = []
        security_groups = []
        self = false
        ipv6_cidr_blocks = []
        prefix_list_ids = []

    }]
}

