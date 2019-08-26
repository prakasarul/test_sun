resource "aws_efs_file_system" "webdata_efs" {
   creation_token = "webdata_efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "Web_Data_EFS"
   }
 }
 
 resource "aws_efs_mount_target" "webdata_efs_1" {
    file_system_id  = "${aws_efs_file_system.webdata_efs.id}"
    subnet_id = "${element(aws_subnet.moonshot-private-web.*.id, count.index)}"
    security_groups = ["${aws_security_group.allow-ssh.id}"]
 }
 
resource "aws_efs_file_system" "appdata_efs" {
   creation_token = "appdata_efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "APP_Data_EFS"
   }
 }
 
 resource "aws_efs_mount_target" "appdata_efs_1" {
   file_system_id  = "${aws_efs_file_system.appdata_efs.id}"
   subnet_id = "${element(aws_subnet.moonshot-private-app.*.id, count.index)}"
   security_groups = ["${aws_security_group.allow-ssh.id}"]
 }

resource "aws_efs_file_system" "dbdata_efs" {
   creation_token = "dbdata_efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "DB_Data_EFS"
   }
 }
 
 resource "aws_efs_mount_target" "dbdata_efs_1" {
   file_system_id  = "${aws_efs_file_system.dbdata_efs.id}"
   subnet_id = "${element(aws_subnet.moonshot-private-dbmaster.*.id, count.index)}"
   security_groups = ["${aws_security_group.allow-ssh.id}"]
 }
