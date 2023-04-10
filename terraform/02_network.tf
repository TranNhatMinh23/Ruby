resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Rails VPC"
  }
}

resource "aws_subnet" "public" {
  count = 2

  cidr_block = "10.0.0.0/24"
  vpc_id     = aws_vpc.main.id

  tags = {
    Name = "Public Subnet"
  }
}
