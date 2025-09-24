data "template_file" "user_data" {
  template = file(var.user_data_path)
}

resource "aws_instance" "instance-1a" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_az1a_id
  vpc_security_group_ids = [var.security_group_id]
  user_data_base64       = base64encode(data.template_file.user_data.rendered)
  key_name               = var.key_name
}

resource "aws_instance" "instance-1b" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_az1b_id
  vpc_security_group_ids = [var.security_group_id]
  user_data_base64       = base64encode(data.template_file.user_data.rendered)
  key_name               = var.key_name
}

resource "aws_lb_target_group" "ec2_lb_tg" {
  name     = "ec2-lb-tg"
  protocol = "HTTP"
  port     = 80
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "ec2_lb_tg-instance_1a" {
  target_group_arn = aws_lb_target_group.ec2_lb_tg.arn
  target_id        = aws_instance.instance-1a.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "ec2_lb_tg-instance_1b" {
  target_group_arn = aws_lb_target_group.ec2_lb_tg.arn
  target_id        = aws_instance.instance-1b.id
  port             = 80
}

resource "aws_lb" "ec2_lb" {
  name               = "ec2-lb"
  load_balancer_type = "application"
  subnets            = [var.subnet_az1a_id, var.subnet_az1b_id]
  security_groups    = [var.security_group_id]
}

resource "aws_lb_listener" "ec2_lb_listener" {
  protocol          = "HTTP"
  port              = 80
  load_balancer_arn = aws_lb.ec2_lb.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ec2_lb_tg.arn
  }
}