# --- loadbalancing ---

resource "aws_lb" "mtc_alb" {
  name            = "mtc-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}

resource "aws_lb_target_group" "mtc_tg" {
  name     = "mtc-lb-tg-${substr(uuid(), 0, 3)}"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
  health_check {
    healthy_threshold   = var.elb_healthy_threshold
    unhealthy_threshold = var.elb_unhealthy_threshold
    timeout             = var.elb_timeout
    interval            = var.elb_interval
  }
  lifecycle {
    ignore_changes        = [name]
    create_before_destroy = true
  }
}


resource "aws_lb_listener" "mtc_lb_listener" {
  load_balancer_arn = aws_lb.mtc_alb.arn
  port              = var.listener_port
  protocol          = var.listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.mtc_tg.arn
  }
}
