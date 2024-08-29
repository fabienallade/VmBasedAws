resource "aws_lb_target_group" "backend_http" {
  name = "${var.application_name}-${var.environment_name}-backend-http"
  port = 5000
  protocol = "HTTP"
  vpc_id = aws_vpc.main.id
  slow_start = 0
  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = true
    type = "lb_cookie"
  }

  health_check {
    enabled = true
    port = 5000
    interval = 30
    protocol = "HTTP"
    path = "/health"
    matcher = 200
    healthy_threshold = 3
    unhealthy_threshold = 3
  }
}