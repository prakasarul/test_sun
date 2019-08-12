resource "aws_security_group" "efs_sg" {
  name        = "moon_efs_sg"
  vpc_id      = "${aws_vpc.moonshot.id}"

  ingress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
    security_groups = ["${aws_security_group.allow-ssh.id}"]
  }

  tags {
    Project         = "Moonshot"
  }
}

resource "aws_efs_file_system" "data_efs" {
  tags {
    Name            = "Data_EFS"
  }
}

resource "aws_efs_mount_target" "data_efs_mount" {
  count                   = "3"
  file_system_id          = "${aws_efs_file_system.data_efs.id}"
  security_groups         = ["${aws_security_group.efs_sg.id}"]
}
