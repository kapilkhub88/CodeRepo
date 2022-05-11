# ---------------------------------------------
#           Create Web Servers
# ---------------------------------------------

# Create EC2 Instance
resource "aws_instance" "webserver1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_1
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-1.id
  user_data              = file("install_apache.sh")
  tags = {
    Name = "Web Server 1"
  }
}

resource "aws_instance" "webserver2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone_2
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]
  subnet_id              = aws_subnet.web-subnet-2.id
  user_data              = file("install_apache.sh")

  tags = {
    Name = "Web Server 2"
  }
}
