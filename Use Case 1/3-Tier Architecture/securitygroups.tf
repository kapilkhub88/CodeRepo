# ---------------------------------------------
#           Create Security Groups
# ---------------------------------------------

# 1.Create a Security Group named web-sg with inbound rule opening HTTP port 80 to CIDR 0.0.0.0/0 and allowing all outbound traffic.
# 2.Create a Security Group named webserver-sg with inbound rule opening HTTP port 80, but this time it’s not open to the world. Instead we are only allowing traffic from our web-sg Security Group.
# 3.Create a Security Group named database-sg with inbound rule opening MySQL port 3306 and once again we keep security tight by only allow the inbound traffic from the webserver-sg Security Group. We open outbound traffic to all the ephemeral ports.

# Create Web Security Group
resource "aws_security_group" "web-sg" {
  name        = var.web_security_group_name
  description = "Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Web-SG"
  }
}

# Create Web Server Security Group
resource "aws_security_group" "webserver-sg" {
  name        = var.server_security_group_name
  description = "Allow inbound traffic from ALB"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow traffic from web layer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.web-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Webserver-SG"
  }
}

# Create Database Security Group
resource "aws_security_group" "database-sg" {
  name        = var.db_security_group_name
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description     = "Allow traffic from application layer"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.webserver-sg.id]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Database-SG"
  }
}
