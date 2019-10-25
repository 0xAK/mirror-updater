#!/bin/bash

MAILRCPT="me@mydomain.foo"
MAILFROM="mirror-updater@mydomain.foo"
MAILSERVER="smtp.mydomain.foo"
MAILSERVERPORT="25"
LOGFILE="/var/log/mirror-updater.log"
DATE=$(date)
SENDMAIL="$HOME/send_mail"
MAILFILE="/var/tmp/mail.txt"

SCRIPT_FILENAME=$(basename "$0")

date > $LOGFILE 2>&1
echo "" > $MAILFILE

send_status_mail () {
  local message=$1
  cat <<-EOF >$MAILFILE
From: $MAILFROM
To: $MAILRCPT
Date: $DATE
Subject: $message
EOF
  cat $LOGFILE >> $MAILFILE
  $SENDMAIL $MAILSERVER $MAILSERVERPORT $MAILFILE >/dev/null 2>&1
}

exec >/var/log/mirror-updater.log 2>&1
/bin/logger -t mirror [$$] Started $SCRIPT_FILENAME
## put update-*.sh loop here ##
UPDATEFILES=`ls $HOME/update-*.sh`
for dingus in $UPDATEFILES
do
  exec $dingus
done
##
/bin/logger -t mirror [$$] Finished $SCRIPT_FILENAME
send_status_mail "mirror-updater report"
