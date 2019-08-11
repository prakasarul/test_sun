resource "aws_security_group" "efs_sg" {
  name        = "Bastion-EFS-SG"
  vpc_id      = "${var.VPC_id}"

  ingress {
    from_port = 2049
    to_port   = 2049
    protocol  = "tcp"
    security_groups = ["${aws_security_group.bastion_public_sg.id}"]
  }

  tags {
    Environment     = "${var.PL_ENV}"
    Project         = "Bastion + ASG + EFS"
    Owner           = "Iban Marco - ibanmarco@gmail.com"
  }
}

resource "aws_efs_file_system" "bastion_efs" {
  tags {
    Name            = "Bastion_EFS"
    Environment     = "${var.PL_ENV}"
    Project         = "Bastion + ASG + EFS"
    Owner           = "Iban Marco - ibanmarco@gmail.com"
  }
}

resource "aws_efs_mount_target" "bastion_efs_mount" {
  count                   = "3"
  file_system_id          = "${aws_efs_file_system.bastion_efs.id}"
  subnet_id               = "${element(var.PubSubnet_Ids, count.index)}"
  security_groups         = ["${aws_security_group.efs_sg.id}"]
}
