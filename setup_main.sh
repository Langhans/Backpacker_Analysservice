#!/bin/bash

##################
#
# Author: Tim Langhans, Qiiwi Interactive, Alingsas, Sweden
# Date: 2017-05-31
#
# Script for setting up the prepared EC2 server to run the "Analysservice".
#
# Make sure the EC2 server is set up for PHP and Apache httpd following  these
# instructions: http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/install-LAMP.html
# install even:
# - BCMath
# - Percona toolkit
# (both available in YUM package manager)
#
BASE_PATH=`pwd`
echo $BASE_PATH

# create ENV variables for database connections
source $BASE_PATH/export-env-variables.sh environment.properties

# setup the history db
source $BASE_PATH/setup-history-db.sh

# copy changed datasource configuration to Anemometer
cp -f $BASE_PATH/datasource_backpacker.inc.php /var/www/html/anemometer/conf/

# copy the changed config file to Anemometer to activate EXPLAIN plugin
cp -f $BASE_PATH/config.inc.php /var/www/html/anemometer/conf/

# copy AWS credentials to HOME
cp -rf $BASE_PATH/.aws /home/ec2-user/

# restrict file permissions on credentials to match Amazons restrictions
chmod 400 /home/ec2-user/.aws/credentials

# place fetch script in HOME directory (fetch slow query reports)
cp -f $BASE_PATH/fetch-report-and-send-to-Anemometer.sh /home/ec2-user/

# make fetch script executable
# chmod u+x /home/ec2-user/fetch-report-and-send-to-Anemometer.sh

# set up cron job for hourly fetching av slow query reports
source $BASE_PATH/setup-cron.sh
