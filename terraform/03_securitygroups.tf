# ALB Security Group (Traffic Internet -> ALB)
resource "aws_security_group" "rails" {
  name        = "rails-security-group"
  description = "Security group for the Rails server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
