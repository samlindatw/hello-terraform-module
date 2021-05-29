// This is an AWS provider block
provider "aws" {
  region = "us-east-1"
}

locals {
  tags = {
    Name = var.Name
    ResourceOwner = var.user_id
    BusinessUnit = var.BusinessUnit != "" ? var.BusinessUnit : "CTP-ENG-LAB"
    EndDate = var.EndDate != "" ? var.EndDate : timeadd(timestamp(), "240h")
    User = var.user_id
  }
}

// This is an AWS resource block that creates an EC2 instance
resource "aws_instance" "example" {
  ami           = data.aws_ami.ubuntu1604_linux_latest.id
  instance_type = "t2.${var.size}"
  tags        = local.tags
  volume_tags = local.tags
}

data "aws_ami" "ubuntu1604_linux_latest" {

  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name = "state"
    values = ["available"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}
