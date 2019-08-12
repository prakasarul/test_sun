resource "aws_efs_file_system" "webdata_efs" {
  tags {
    Name            = "Web_Data_EFS"
  }
}

resource "aws_efs_mount_target" "webdata_efs_mount" {
  count                   = "3"
  file_system_id          = "${aws_efs_file_system.webdata_efs.id}"
  subnet_id               = "${aws_subnet.moonshot-private-web.id}"
  security_groups         = ["${aws_security_group.allow_ssh.id}"]
}

resource "aws_efs_file_system" "appdata_efs" {
  tags {
    Name            = "App_Data_EFS"
  }
}

resource "aws_efs_mount_target" "appdata_efs_mount" {
  count                   = "3"
  file_system_id          = "${aws_efs_file_system.webdata_efs.id}"
  subnet_id               = "${aws_subnet.moonshot-private-app.id}"
  security_groups         = ["${aws_security_group.allow_ssh.id}"]
}
