##!/bin/bash

#web=`terraform output|grep -w -A1 efs_mount_target_ip_address|tail -n 1|sed 's/ //g'`
#app=`terraform output|grep -w -A1 efs_mount_target_ip_address_1|tail -n 1|sed 's/ //g'`
#sed 's/retrans=2.*:/retrans=2 '$web':/g' webmount.sh
#sed 's/retrans=2.*:/retrans=2 '$app':/g' appmount.sh
