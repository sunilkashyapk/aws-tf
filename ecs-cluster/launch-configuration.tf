resource "aws_launch_configuration" "ecs-launch-configuration" {
    name                         = "ecs-launch-configuration"
    instance_type               = "t2.xlarge"
    image_id                     = "ami-050865a806e0dae53"
    #instance_type                = "t2.micro"
    iam_instance_profile         = "${aws_iam_instance_profile.ecs-instance-profile.id}"     

    root_block_device {
      volume_type = "standard"
      volume_size = 100
      delete_on_termination = true
    }

    # tag {
    #        type = "web-server"           
    # }


    lifecycle {
      create_before_destroy = true
    }

    security_groups             = ["${aws_security_group.test_public_sg.id}"]
    associate_public_ip_address = "true"
    key_name                    = "${var.ecs_key_pair_name}"
    user_data                   = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
                                  echo ECS_ENGINE_AUTH_TYPE = docker >> /etc/ecs/ecs.config
                                  echo ECS_LOGLEVEL = debug >> /etc/ecs/ecs.config
                                  
                                  EOF
}
