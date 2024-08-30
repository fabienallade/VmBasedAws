resource "aws_security_group" "backend_lb" {
  name        = "${var.application_name}-${var.environment_name}-backend-lb-sg"
  description = "Security Group for load balancer"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "backend_lb_ingress_http" {
  from_port                = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_lb.id
  source_security_group_id = aws_security_group.frontend.id
  to_port                  = 80
  type                     = "ingress"
}

resource "aws_security_group_rule" "backend_lb_egress_http" {
  from_port                = 5000
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_lb.id
  source_security_group_id = aws_security_group.backend.id
  to_port                  = 5000
  type                     = "ingress"
}