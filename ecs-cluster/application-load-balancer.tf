
resource "aws_alb" "ecs-load-balancer" {
    name                = "ecs-load-balancer"
    security_groups     = ["${aws_security_group.alb_security_group.id}"]
    subnets             = ["${aws_subnet.test_public_sn_01.id}", "${aws_subnet.test_public_sn_02.id}"]

    tags {
      Name = "ecs-load-balancer"
    }
}

resource "aws_security_group" "alb_security_group" {
  name = "alb_security_group"
  description = "Test public access security group"
  vpc_id = "${aws_vpc.test_vpc.id}"
  

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    # allow all traffic to private SN
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  tags {
    Name = "alb_security_group"
  }
}


resource "aws_alb_target_group" "ecs-target-group" {
    name                = "ecs-target-group"
    port                = "80"
    protocol            = "HTTP"
    vpc_id              = "${aws_vpc.test_vpc.id}"

    health_check {
        healthy_threshold   = "5"
        unhealthy_threshold = "2"
        interval            = "30"
        matcher             = "200"
        path                = "/"
        port                = "traffic-port"
        protocol            = "HTTP"
        timeout             = "5"
    }

    tags {
      Name = "ecs-target-group"
    }

    depends_on = ["aws_alb.ecs-load-balancer"]
}

resource "aws_alb_listener" "alb-listener" {
    load_balancer_arn = "${aws_alb.ecs-load-balancer.arn}"
    port              = "80"
    protocol          = "HTTP"

    default_action {
        target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
        type             = "forward"
    }
}

data "aws_instances" "test" {
  
  filter {    
    name = "tag:Environment"
    values = ["dev"]
  }
  instance_state_names = ["running"]
  depends_on = ["aws_alb_target_group.ecs-target-group"]
}

resource "aws_lb_target_group_attachment" "main" {
    #count = 1
   target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
   target_id        = "${data.aws_instances.test.ids[0]}"   
   port             = 80
   
}

resource "aws_lb_target_group_attachment" "main1" {
    #count = 1
   target_group_arn = "${aws_alb_target_group.ecs-target-group.arn}"
   target_id        = "${data.aws_instances.test.ids[1]}"   
   port             = 80   
}


