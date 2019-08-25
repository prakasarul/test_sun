ips=""
ids=""
while [ "$ids" = "" ]; do
  ids=$(aws autoscaling describe-auto-scaling-groups --auto-scaling-group-names $ASG --query AutoScalingGroups[].Instances[].InstanceId --output text)
  sleep 1
done
for ID in $ids;
do
    IP=$(aws ec2 describe-instances --instance-ids $ID --query Reservations[].Instances[].PrivateIpAddress --output text)
    ips="$ips,$IP"
done
