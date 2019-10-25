#!/bin/bash

MODULE=CHANGE_ME_YOUR_RSYNC_MODULE
SCRIPT_FILENAME=$(basename "$0")
LOG=/var/log/mirror.log
MOD_LOGFILE=mirror-$MODULE.log
RSYNC_OPT="-arILt --log-file=/var/log/$MOD_LOGFILE --partial --no-motd --delete-after"
REPOROOT=CHANGE_ME_YOUR_LOCAL_FILE_LOCATION
TIMESTAMP=`(date +"%Y/%m/%d %T")`
HOST=CHANGE_ME_YOUR_UPSTREAM_RSYNC_SERVER

# log start
/bin/logger -t mirror [$$] Started $SCRIPT_FILENAME
/bin/echo $TIMESTAMP: Started $SCRIPT_FILENAME >> $LOG

## rsync 

/bin/echo $TIMESTAMP: $SCRIPT_FILENAME rsync run start >> $LOG
/bin/rsync $RSYNC_OPT --include-from=$HOME/rsync-include-$SCRIPT_FILENAME.txt --exclude='*' rsync://$HOST/$MODULE $REPOROOT/$MODULE
/bin/echo $TIMESTAMP: $SCRIPT_FILENAME rsync run end >> $LOG

# log finish
/bin/logger -t mirror [$$] Finished $SCRIPT_FILENAME
/bin/echo $TIMESTAMP: Finished $SCRIPT_FILENAME | >> $LOG
