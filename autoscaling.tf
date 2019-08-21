resource "aws_launch_configuration" "moonshot-launchconfig-web" {
  name_prefix          = "moonshot-launchconfig-web"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  count                = "${var.count}"
  key_name             = "${aws_key_pair.mykey.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
  user_data = "${file("webmount.sh")}"
  
  provisioner "local-exec" {
    command = "terraform output|grep -w -A1 efs_mount_target_ip_address|tail -n 1|sed 's/ //g'"
  }
  
  #provisioner "remote-exec" {
  #  inline = [
  #   "sudo mkdir -p /efs_web",
  #    "sudo mount -t nfs4 -o nfsvers=4.1 $web:/ /efs_web",
  #    "sudo su -c \"echo '$web:/ /efs_web nfs defaults,vers=4.1 0 0' >> /etc/fstab\"",
  #  ]
  #}
}

resource "aws_launch_configuration" "moonshot-launchconfig-app" {
  name_prefix          = "moonshot-launchconfig-app"
  image_id             = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type        = "t2.micro"
  count                = "${var.count}"
  key_name             = "${aws_key_pair.mykey.key_name}"
  security_groups      = ["${aws_security_group.allow-ssh.id}"]
  user_data = "${file("appmount.sh")}"

  provisioner "local-exec" {
    command = "terraform output|grep -w -A1 efs_mount_target_ip_address_1|tail -n 1|sed 's/ //g'"
  }
  
#provisioner "remote-exec" {
#    inline = [
 #     "sudo mkdir -p /efs_app",
 #     "sudo mount -t nfs4 -o nfsvers=4.1 $app:/ /efs_app",
  #    "sudo su -c \"echo '$app:/ /efs_app nfs defaults,vers=4.1 0 0' >> /etc/fstab\"",
   # ]
  #}
}

resource "aws_autoscaling_group" "moonshot-autoscaling-web" {
  name                 = "moonshot-autoscaling-web"
  vpc_zone_identifier  = ["${aws_subnet.moonshot-private-web.id}"]
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

resource "aws_autoscaling_attachment" "asg_attachment_bar_web" {
  autoscaling_group_name = "${aws_autoscaling_group.moonshot-autoscaling-web.id}"
  elb                    = "${aws_elb.my-elb.id}"
}

resource "aws_autoscaling_group" "moonshot-autoscaling-app" {
  name                 = "moonshot-autoscaling-app"
  vpc_zone_identifier  = ["${aws_subnet.moonshot-private-app.id}"]
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

resource "aws_autoscaling_attachment" "asg_attachment_bar_app" {
  autoscaling_group_name = "${aws_autoscaling_group.moonshot-autoscaling-app.id}"
  elb                    = "${aws_elb.my-elb.id}"
}
