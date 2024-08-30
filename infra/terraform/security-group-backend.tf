resource "aws_security_group" "backend" {
  name        = "${var.application_name}-${var.environment_name}-backend-sg"
  description = "Security group for backend Ec2 instances"
  vpc_id      = aws_vpc.main.id
}

resource "aws_security_group_rule" "backend_http" {
  from_port                = 5000
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend.id
  source_security_group_id = aws_security_group.backend_lb.id
  to_port                  = 5000
  type                     = "ingress"
}

resource "aws_security_group_rule" "backend_ssh" {
  from_port                = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.backend_lb.id
  source_security_group_id = aws_security_group.frontend.id
  to_port                  = 22
  type                     = "ingress"
}