#!/bin/bash
#useradd weblogic
#passwd weblogic 12345
cd /tmp/
cp wget.sh wls.loc wls.rsp /home/ec2-user
cd /home/ec2-user
sudo yum update -y
sudo yum install wget -y
wget https://download.oracle.com/java/17/archive/jdk-17.0.10_linux-x64_bin.tar.gz
tar -xvzf jdk-17.0.10_linux-x64_bin.tar.gz
mv jdk-*/ java/
echo 'export JAVA_HOME=/home/ec2-user/java' >> /home/ec2-user/.bashrc
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/ec2-user/.bashrc
source /home/ec2-user/.bashrc
./wget.sh
sudo yum install unzip -y
unzip V*.zip
#password=12345
#echo "$password" | sudo -S -u weblogic
java -jar *.jar -silent -responseFile /home/ec2-user/wls.rsp -invPtrLoc /home/ec2-user/wls.loc
