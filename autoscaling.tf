resource "aws_launch_configuration" "moonshot-launchconfig-web" {
  name_prefix          = "moonshot-launchconfig-web"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  count                = "${var.count}"
  key_name             = "${aws_key_pair.mykey.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
}

resource "aws_launch_configuration" "moonshot-launchconfig-app" {
  name_prefix          = "moonshot-launchconfig-app"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  count                = "${var.count}"
  key_name             = "${aws_key_pair.mykey.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
}

resource "aws_autoscaling_group" "moonshot-autoscaling-web" {
  name                 = "moonshot-autoscaling-web"
  vpc_zone_identifier  = ["${aws_subnet.moonshot-private-web.id}"]
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  launch_configuration = "${aws_launch_configuration.moonshot-launchconfig-web.name}"
  min_size             = 2
  max_size             = 4
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
      key = "Name"
      value = "${format("web-%03d", count.index + 1)}"
      propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "moonshot-autoscaling-app" {
  name                 = "moonshot-autoscaling-app"
  vpc_zone_identifier  = ["${aws_subnet.moonshot-private-app.id}"]
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  launch_configuration = "${aws_launch_configuration.moonshot-launchconfig-app.name}"
  min_size             = 2
  max_size             = 4
  health_check_grace_period = 300
  health_check_type = "EC2"
  force_delete = true

  tag {
      key = "Name"
      value = "${format("app-%03d", count.index + 1)}"
      propagate_at_launch = true
  }
}
