resource "aws_security_group" "security_jenkins_port" {
  name        = "security_jenkins_port"
  description = "security group for jenkins"
  vpc_id      = "vpc-07a1b5379c601eadb"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound from jenkis server
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_jenkins_port"
  }
}

resource "aws_instance" "my1FirstInstance" {
  ami             = "ami-03fa4afc89e4a8a09"
  key_name        = var.key_name
  instance_type   = var.instance_type
  security_groups = ["security_jenkins_port"]
  tags = {
    Name = "jenkins_instance1"
  }
}
resource "aws_instance" "my1SecondInstance" {
  ami             = "ami-03fa4afc89e4a8a09"
  key_name        = var.key_name
  instance_type   = var.instance_type
  security_groups = ["security_jenkins_port"]
  tags = {
    Name = "ansible_instance1"
  }
}
