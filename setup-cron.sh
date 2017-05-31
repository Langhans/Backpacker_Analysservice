#!/bin/bash

############
#
# Author: Tim Langhans, Qiiwi Interactive, Alingsas, Sweden
# Date: 2017-05-31
#
# Adds a Cron-job for fetching the slow query report.
# The refresh rate of the graphical user interface is defined
# by the run intervall of the Cron job!

# fetch cron tab
crontab -l > mycron

# add fetch script task to cron
echo "/5 * * * * /bin/bash /home/ec2-user/fetch-report-and-send-to-Anemometer.sh >> /home/ec2-user/cron_err.log 2>&1" >> mycron

# make sure crontab finishes with an empty line
echo "" >> mycron

# add new cron job
crontab mycron

# clean up
rm mycron
