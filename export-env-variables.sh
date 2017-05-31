#!/bin/bash

########
#
# Author: Tim Langhans, Qiiwi Interactive, Alingsas, Sweden
# Date: 22017-05-31
#
# Writes the desired environment variable settings from properties file
# (see environment.properties) to .bashrc and to /etc/sysconfig/httpd to let your
# Apache server pass them through to the PHP code of Anemometer.
#
# Assumes that the name of the properties file is passed as the first argument
#
# Assumes that the .bashrc file is placed in the default Home directory of a
# AWS EC2 Instance, namely 'ec2-user'.

PROPFILE="";

if [ -f "$1" ]; then
  PROPFILE="$1"
fi

while read -r line
do
  echo "export $line" >> /home/ec2-user/.bashrc
  echo "export $line" >> /etc/sysconfig/httpd
done < "$PROPFILE"

exit
