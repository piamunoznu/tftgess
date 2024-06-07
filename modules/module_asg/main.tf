resource "aws_launch_template" "asgLT" {
    name = var.dataLT.nameLT
    tag_specifications {
        resource_type = "instance"
        tags = {
            Name = var.dataLT.tagname
        }
    }
    tag_specifications {
        resource_type = "volume"
        tags = {
            Name = var.dataLT.tagname
        }
    }
    user_data = filebase64("${path.module}/setup_script.sh")
    iam_instance_profile {
        arn = var.ec2role
    }
    vpc_security_group_ids = [
        var.albsg
    ]
    image_id = var.dataLT.ami
    instance_type = var.dataLT.itype
}

resource "aws_autoscaling_group" "terraAWSASG" {
    name = var.dataASG.name
    launch_template {
        id = aws_launch_template.asgLT.id
        version = "$Latest"
    }
    min_size = 2
    max_size = 3
    desired_capacity = 0
    default_cooldown = 300

    target_group_arns = [
        var.albtgarn
    ]
    health_check_type = "ELB"
    health_check_grace_period = 300
    vpc_zone_identifier = [ for psub in var.pubsub : psub ]
    termination_policies = [
        "Default"
    ]

    tag {
        key = "Name"
        value = var.dataASG.name
        propagate_at_launch = true
    }
}