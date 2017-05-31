#!/bin/bash

########################
#
# Author: Tim Langhans, Qiiwi Interactive, Alingsas, Sweden
# Date: 2017-05-31
#
# sets up Anemometers history and review database
mysql -h "$DB_HOST" --user="$DB_USER" --password="$DB_PASS"  < /var/www/html/anemometer/install.sql
mysql -h "$DB_HOST" --user="$DB_USER" --password="$DB_PASS" -e "grant ALL ON slow_query_log.* to '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
