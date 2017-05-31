#!/bin/bash

#################
#
# Author: Tim Langhans, Qiiwi Interactive, Alingsas, Sweden
# Date: 2017-05-31
#
# Tool for fetching MySQL slow-query logs from your Amazon AWS
# MySQL database, even in Aurora, using the AWS Command Line Client.
# The log files are then analyzed with Perconas PT-Query-Digest and the results
# are saved directly to Anemometers database.

# read in ENV variables to be able to run script in Cron
source /home/ec2-user/.bashrc

# path to lastet slow query log - slowquery.log
# Does not have to be saved after script finished!
SLOWLOG=/tmp/rds_slow.log

# fetch latest slow query log from AWS
aws rds download-db-log-file-portion \
    --db-instance-identifier $AWS_INSTANCE \
    --output text \
    --log-file-name slowquery/mysql-slowquery.log > $SLOWLOG

# pt-query-digest path
PTQD=/usr/local/bin/pt-query-digest

# analyze slow-query-rapport and send result to Anemometers database
pt-query-digest --user=$DB_USER --password=$DB_PASS \
--review h=$DB_HOST,D=slow_query_log,t=global_query_review \
--history h=$DB_HOST,D=slow_query_log,t=global_query_review_history \
--no-report --limit=0% \
--filter=" \$event->{Bytes} = length(\$event->{arg}) and \$event->{hostname}=\"$DB_HOST\"" \
$SLOWLOG
