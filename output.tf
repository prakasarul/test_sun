# --------------
# Module Outputs
# --------------
output "efs_filesystem_id" {
  value = "${aws_efs_file_system.webdata_efs.id}"
}

output "efs_mount_target_id" {
  value = "${aws_efs_mount_target.webdata_efs_1.*.id}"
}

output "efs_mount_target_dns_name" {
  value = "${aws_efs_mount_target.webdata_efs_1.*.dns_name}"
}

output "efs_mount_target_network_interface_id" {
  value = "${aws_efs_mount_target.webdata_efs_1.*.network_interface_id}"
}

output "efs_mount_target_ip_address" {
  value = "${aws_efs_mount_target.webdata_efs_1.*.ip_address}"
}

output "efs_filesystem_id_1" {
  value = "${aws_efs_file_system.appdata_efs.id}"
}

output "efs_mount_target_id_1" {
  value = "${aws_efs_mount_target.appdata_efs_1.*.id}"
}

output "efs_mount_target_dns_name_1" {
  value = "${aws_efs_mount_target.appdata_efs_1.*.dns_name}"
}

output "efs_mount_target_network_interface_id_1" {
  value = "${aws_efs_mount_target.appdata_efs_1.*.network_interface_id}"
}

output "efs_mount_target_ip_address_1" {
  value = "${aws_efs_mount_target.appdata_efs_1.*.ip_address}"
}
