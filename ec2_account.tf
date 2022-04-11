provider "aws" {
  region = "eu-west-3"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
