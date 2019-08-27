# --------------
# Module Outputs
# --------------

output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.moonshot.*.id}"
}
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${aws_vpc.moonshot.*.cidr_block}"
}
output "security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = "${aws_security_group.allow-ssh.*.id}"
}
output "security_group_id_elb" {
  description = "The ID of the security group created by default on VPC creation"
  value       = "${aws_security_group.elb-securitygroup.*.id}"
}

output "default_route_table_id" {
  description = "The ID of the default route table"
  value       = "${aws_route_table.moonshot-public.*.id}"
}
output "jump_public_subnets" {
  description = "List of IDs of jump public subnets"
  value       = "${aws_subnet.moonshot-public.*.id}"
}
output "jump_public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of junp public subnets"
  value       = "${aws_subnet.moonshot-public.*.cidr_block}"
}
output "web_private_subnets" {
  description = "List of IDs of web private subnets"
  value       = "${aws_subnet.moonshot-private-web.*.id}"
}
output "web_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of web private subnets"
  value       = "${aws_subnet.moonshot-private-web.*.cidr_block}"
}

output "app_private_subnets" {
  description = "List of IDs of app private subnets"
  value       = "${aws_subnet.moonshot-private-app.*.id}"
}
output "app_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of app private subnets"
  value       = "${aws_subnet.moonshot-private-app.*.cidr_block}"
}

output "dbmaster_private_subnets" {
  description = "List of IDs of dbmaster private subnets"
  value       = "${aws_subnet.moonshot-private-dbmaster.*.id}"
}
output "dbmaster_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of dbmaster private subnets"
  value       = "${aws_subnet.moonshot-private-dbmaster.*.cidr_block}"
}

output "dbslave_private_subnets" {
  description = "List of IDs of dbslave private subnets"
  value       = "${aws_subnet.moonshot-private-dbslave.*.id}"
}
output "dbslave_private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of dbslave private subnets"
  value       = "${aws_subnet.moonshot-private-dbslave.*.cidr_block}"
}

output "nat_ids" {
  description = "List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = "${aws_nat_gateway.moonshot-nat-gw.*.id}"
}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = "${aws_eip.moonshot-nat.*.public_ip}"
}

output "natgw_ids" {
  description = "List of NAT Gateway IDs"
  value       = "${aws_nat_gateway.moonshot-nat.*.id}"
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = "${aws_internet_gateway.moonshot-gw.*.id}"
}

output "efs_mount_target_dns_name_web" {
  value = "${aws_efs_mount_target.webdata_efs_1.*.dns_name}"
}

output "efs_mount_target_ip_address_web" {
  value = "${aws_efs_mount_target.webdata_efs_1.*.ip_address}"
}

output "efs_mount_target_dns_name_app" {
  value = "${aws_efs_mount_target.appdata_efs_1.*.dns_name}"
}

output "efs_mount_target_ip_address_app" {
  value = "${aws_efs_mount_target.appdata_efs_1.*.ip_address}"
}

output "efs_mount_target_dns_name_db" {
  value = "${aws_efs_mount_target.dbdata_efs_1.*.dns_name}"
}

output "efs_mount_target_ip_address_app" {
  value = "${aws_efs_mount_target.dbdata_efs_1.*.ip_address}"
}

output "jump_server_ip" {
  description = "List of public IPs created for jump server"
  value       = "${aws_instance.jump.*.public_ip}"
}

output "dbmaster_server_ip" {
  description = "List of private IPs created for DB Master"
  value       = "${aws_instance.dbmaster.*.private_ip}"
}

output "dbslave_server_ip" {
  description = "List of private IPs created for DB DB Slave"
  value       = "${aws_instance.dbmaster.*.private_ip}"
}
