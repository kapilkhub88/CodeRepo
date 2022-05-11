# ---------------------------------------------
#       Create Application Load Balancer
# ---------------------------------------------

resource "aws_lb" "external-elb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.web-sg.id]
  subnets            = [aws_subnet.web-subnet-1.id, aws_subnet.web-subnet-2.id]
  depends_on = [
    aws_instance.webserver1, aws_instance.webserver2
  ]
}

resource "aws_lb_target_group" "external-elb" {
  name     = var.targetgroup_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
  depends_on = [
    aws_instance.webserver1, aws_instance.webserver2
  ]
}

resource "aws_lb_target_group_attachment" "external-elb1" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.webserver1.id
  port             = 80

  depends_on = [
    aws_instance.webserver1, aws_instance.webserver2
  ]
}

resource "aws_lb_target_group_attachment" "external-elb2" {
  target_group_arn = aws_lb_target_group.external-elb.arn
  target_id        = aws_instance.webserver2.id
  port             = 80

  depends_on = [
    aws_instance.webserver1, aws_instance.webserver2
  ]
}

resource "aws_lb_listener" "external-elb" {
  load_balancer_arn = aws_lb.external-elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.external-elb.arn
  }
  depends_on = [
    aws_instance.webserver1, aws_instance.webserver2
  ]
}
