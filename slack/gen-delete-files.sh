#!/bin/bash

# This script will generate a list of files belonging to a Slack user after or before a certain date based on input
# It will then generate another script to delete those files using the user token

if [ $# -ne 2 ]
then
  echo "Missing arguments "
  echo "$0 [after|before] <epoch time>"
  exit
fi

if [ $1 != "before" ] && [ $1 != "after" ]
then
  echo "$0 [after|before] <epoch time>"
  exit
fi

if [ $1 = "before" ]
then
  time_param="ts_to"
fi

if [ $1 = "after" ]
then
  time_param="ts_from"
fi

epoch_time=$2

myuser="U4SSDAFA4"
user_token="user-token-goes-here"


> del_my_files.sh
#curl "https://slack.com/api/files.list?token=$user_token&$time_param=$epoch_time&$user_param&pretty=1" > newones.json
curl "https://slack.com/api/files.list?token=$user_token&$time_param=$epoch_time&user=$myuser&pretty=1" > newones.json
grep '"id":' newones.json | awk -v user_token="$user_token" -F'"' 'BEGIN {a="\047"} {print "curl -X POST -d token=user_token -d " a "file=" $4 a " " "https://slack.com/api/files.delete" }' >> del_my_files.sh
chmod 755 del_my_files.sh
