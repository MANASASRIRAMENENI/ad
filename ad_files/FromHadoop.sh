#!/bin/bash

export FROM_HADOOP_PROFILE=1
uname=$(whoami)
hdir=""

if [[ $uname == "root" ]]
then
        exit
else
        hdir="/user/$uname"
        hadoop fs -ls -d $hdir
        lsout=$(echo $?)
        echo $lsout
        if [[ $lsout != 0 ]]
        then
                echo file does not exists
                sudo -u hdfs hadoop fs -mkdir $hdir
                sudo -u hdfs hadoop fs -chown $uname $hdir
                sudo -u hdfs hadoop fs -chmod 770 $hdir
                fi
fi
