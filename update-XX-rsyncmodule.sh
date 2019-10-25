#!/bin/bash

MODULE=CHANGE_ME_YOUR_RSYNC_MODULE
SCRIPT_FILENAME=$(basename "$0")
LOGFILE=mirror-$MODULE.log
RSYNC_OPT="-arILt --log-file=/var/log/$LOGFILE --partial --no-motd --delete-after"
REPOROOT=CHANGE_ME_YOUR_LOCAL_FILE_LOCATION
TIMESTAMP=`(date +"%Y/%m/%d %T")`
HOST=CHANGE_ME_YOUR_UPSTREAM_RSYNC_SERVER

# log start
/bin/logger -t mirror [$$] Started $SCRIPT_FILENAME
/bin/echo $TIMESTAMP: Started $SCRIPT_FILENAME >> /var/log/mirror.log

## rsync 

/bin/echo $TIMESTAMP: $SCRIPT_FILENAME rsync run start >> /var/log/mirror.log
/bin/rsync $RSYNC_OPT --include-from=$HOME/rsync-include-$SCRIPT_FILENAME.txt --exclude='*' rsync://$HOST/$DIR $REPOROOT/$DIR
/bin/echo $TIMESTAMP: $SCRIPT_FILENAME rsync run end >> /var/log/mirror.log

# log finish
/bin/logger -t mirror [$$] Finished $SCRIPT_FILENAME
/bin/echo $TIMESTAMP: Finished $SCRIPT_FILENAME | >> /var/log/mirror.log
