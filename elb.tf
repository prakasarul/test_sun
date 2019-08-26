resource "aws_elb" "my-elb-web" {
  name = "my-elb"
  subnets = ["${aws_subnet.moonshot-private-web.id}"]
  security_groups = ["${aws_security_group.elb-securitygroup.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "my-elb-web"
  }
}

    
resource "aws_elb" "my-elb-app" {
  name = "my-elb"
  subnets = ["${aws_subnet.moonshot-private-app.id}"]
  security_groups = ["${aws_security_group.elb-securitygroup.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "my-elb-app"
  }
}
