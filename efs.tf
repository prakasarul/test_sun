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
    count = "${length(split(", ", lookup(var.azs, var.AWS_REGION)))}"
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
   count = "${length(split(", ", lookup(var.azs, var.AWS_REGION)))}"
   file_system_id  = "${aws_efs_file_system.appdata_efs.id}"
   subnet_id = "${element(aws_subnet.moonshot-private-app.*.id, count.index)}"
   security_groups = ["${aws_security_group.allow-ssh.id}"]
 }

#data "template_file" "webm" {
 # template = "${file("webmount.sh.tpl")}"

  #vars = {
   # web = "${aws_efs_mount_target.webdata_efs_1.*.ip_address}"
  #}
#}

#data "template_file" "appm" {
#  template = "${file("appmount.sh.tpl")}"

 # vars = {
 #   app = "${aws_efs_mount_target.appdata_efs_1.*.ip_address}"
 # }
#}
