#!/bin/bash
 
export FROM_HADOOP_PROFILE=1
uname=`whoami`
hdir=""
 
if [[ "\$uname" == "root" ]]
then
        hdir="/root"
else
        hdir="/user/\$uname"
fi
 
hadoop fs -ls -d \$hdir
lsout=\`echo \$?\`
echo \$lsout
if [[ "\$lsout" != "0" ]]
then
      echo file does not exists
      sudo -u hdfs hadoop fs -mkdir \$hdir
fi
