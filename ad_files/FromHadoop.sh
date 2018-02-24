#!/bin/bash

export FROM_HADOOP_PROFILE=1
#uname=$(whoami)
uname=$1
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
                sudo -u hdfs hadoop fs -chown $uname:$2 $hdir
                sudo -u hdfs hadoop fs -chmod 770 $hdir
                fi
#homedir="/home/$uname"
#ls $homedir
#lsout1=$(echo $?)
#echo $lsout1
#if [[ $lsout1 != 0 ]]
#then
#echo directory doesnt exist
ssh $uname@$3
#        sshout1=$(echo $?)
#        echo $sshout1
ssh $uname@$4
#        sshout2=$(echo $?)
#        echo $sshout2
#        fi
fi
