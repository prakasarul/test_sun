vars {
    web = "${aws_efs_mount_target.webdata_efs_1.*.ip_address}"
  }

vars {
    app = "${aws_efs_mount_target.appdata_efs_1.*.ip_address}"
  }
