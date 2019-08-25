#!/bin/bash

sudo yum update -y
sudo yum install -y nfs-utils
sudo mkdir /efs
sudo chmod 777 /efs
