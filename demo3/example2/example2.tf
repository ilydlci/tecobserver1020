terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-08c148bb835696b45"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tfkey.key_name

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("terraform")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello, World!' > hello.txt"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
}

resource "aws_key_pair" "tfkey" {
  key_name   = "tfexamplekey"
  public_key = file("terraform.pub")
}
