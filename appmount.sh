#!/bin/bash

sudo yum update -y
sudo yum install -y nfs-utils
sudo mkdir /efs
sudo chmod 777 /efs
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${output.efs_mount_target_ip_address_1}:/ /efs
