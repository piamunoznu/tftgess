resource "aws_lb_target_group" "albtg" {
  name     = var.albtgdata.name
  port     = 80
  protocol = var.albtgdata.proto
  vpc_id   = var.vpcid
}

resource "aws_lb_listener" "ALB-FE-rule" {
  load_balancer_arn = aws_lb.tfalb.arn
  port              = var.albdata.proto1
  protocol          = var.albtgdata.proto

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.albtg.arn
  }
}

resource "aws_lb" "tfalb" {
  name               = var.albdata.name
  internal           = false
  load_balancer_type = var.albdata.type
  security_groups    = [var.albsg]
  subnets            = [for psub in var.pubsub : psub]


}