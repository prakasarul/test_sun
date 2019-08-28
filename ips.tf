resource "null_resource" "get_ips" {
  provisioner "local-exec" {
    command = "aws ec2 describe-instances --filters Name=vpc-id,Values=${aws_vpc.moonshot.id} --query 'Reservations[].Instances[].[PrivateIpAddress,InstanceId,Tags[?Key==`Name`].Value[]]' --output text | sed 's/None$/None\n/' | sed '$!N;s/\n/ /'"
  }

 # depends_on = ["null_resource.kubespray"]
}
