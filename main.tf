provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "BartTerraform-EC2-t2-micro" {
    ami = "ami-0fc970315c2d38f01"
    instance_type = "t2.micro"

    tags = {
      "Name" = "Bart's awesome EC2"
    }
}

