resource "aws_security_group" "elbpublicsg" {
  name        = "ALBSG"
  description = "Allow traffic from clients"
  vpc_id      = var.vpcid

  dynamic "ingress" {
    for_each = var.ingres_port_listALB
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ALBSG"
  }

}

resource "aws_security_group" "ec2publicsg" {
  name        = "WebEC2SG"
  description = "Allow traffic from ALBSG"
  vpc_id      = var.vpcid

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebEC2SG"
  }

}

resource "aws_security_group_rule" "allow-webtraffic-from-alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2publicsg.id
  source_security_group_id = aws_security_group.elbpublicsg.id
}

resource "aws_security_group_rule" "allow-webtraffic-from-alb2" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.ec2publicsg.id
  cidr_blocks = [var.sg_ingress_cidr]
}

resource "aws_security_group_rule" "allow-webtraffic-from-alb3" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.ec2publicsg.id
  cidr_blocks       = [var.sg_ingress_cidr]
}