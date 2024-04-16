#!/bin/bash
cp /tmp/create-domain.py /home/ec2-user/Oracle/Middleware/Oracle_home/oracle_common/common/bin
cp /tmp/runweblogic.sh  /home/ec2-user/Oracle/Middleware/Oracle_home/oracle_common/common/bin
/home/ec2-user/Oracle/Middleware/Oracle_home/oracle_common/common/bin/runweblogic.sh
nohup /home/ec2-user/Oracle/Middleware/Oracle_home/user_projects/domains/Testing_Base_Domain/bin/startWebLogic.sh > /tmp/output.log 2>&1 &