provider "aws" {
  access_key = env.AWS_ACCESS_KEY_ID
  secret_key = env.AWS_ACCESS_KEY_ID
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"
}
