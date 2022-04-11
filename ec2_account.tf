provider "aws" {
  region = "eu-west-3"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "terraform-training" {
  ami = ""
  instance_type = "t3a.micro"
}
