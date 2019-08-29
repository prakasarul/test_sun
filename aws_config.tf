resource "null_resource" "cre" {
  provisioner "local-exec" {
    command = "aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID"
    command = "aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY"
    command = "aws configure set default.region ap-south-1"
    command = "aws ec2 describe-instances --output table"
  }
#  depends_on = ["null_resource.create-endpoint"]
}
