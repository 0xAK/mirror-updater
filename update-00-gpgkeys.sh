#!/bin/bash
PREFIX=$HOME/gpg-keys
KEYDIR=$PREFIX/keys
KEYPREVRUN=$PREFIX/keys-previous-run
SCRIPT_FILENAME=$(basename "$0")

# Clean up $KEYDIR
/bin/rm -f $KEYPREVRUN/*
/bin/mv $KEYDIR/* $KEYPREVRUN/

# Timestamp
/bin/echo "Contents of this directory created by $SCRIPT_FILENAME run at `/bin/date`" > $KEYDIR/TIMESTAMP.txt

# log start
/bin/logger -t mirror [$$] Started $SCRIPT_FILENAME

# Go get the keys and install them!

## Debian ##################################
## https://ftp-master.debian.org/keys.html #
############################################
# Debian 8/jessie archive signing key
/bin/wget -q -P $KEYDIR https://ftp-master.debian.org/keys/archive-key-8.asc
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/archive-key-8.asc
# Debian 8/jessie security archive signing key
/bin/wget -q -P $KEYDIR https://ftp-master.debian.org/keys/archive-key-8-security.asc
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/archive-key-8-security.asc
# Debian 9/stretch archive signing key
/bin/wget -q -P $KEYDIR https://ftp-master.debian.org/keys/archive-key-9.asc
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/archive-key-9.asc
# Debian 9/strech security archive signing key
/bin/wget -q -P $KEYDIR https://ftp-master.debian.org/keys/archive-key-9-security.asc
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/archive-key-9-security.asc
# Debian 10/buster archive signing key
/bin/wget -q -P $KEYDIR https://ftp-master.debian.org/keys/archive-key-10.asc
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/archive-key-10.asc
# Debian 10/buster security archive signing key
/bin/wget -q -P $KEYDIR https://ftp-master.debian.org/keys/archive-key-10-security.asc
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/archive-key-10-security.asc

## CentOS #######################
## https://www.centos.org/keys/ #
#################################
# CentOS Official Key (starting from CentOS 8)
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-Official
# CentOS-6 Signing Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-6
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-6
# CentOS-6 Debug Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Debug-6
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-Debug-6
# CentOS-6 Testing Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Testing-6
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-Testing-6
# CentOS-6 Security Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Security-6
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-Security-6
# CentOS 7 Signing Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-7
# CentOS 7 Debug Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Debug-7
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-Debug-7
# CentOS 7 Testing Key
/bin/wget -q -P $KEYDIR https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Testing-7
/usr/bin/gpg --no-default-keyring --keyring=$HOME/.gnupg/trustedkeys.gpg --import $KEYDIR/RPM-GPG-KEY-CentOS-Testing-7

## Ubuntu #####################
## hkp://keyserver.ubuntu.com #
###############################
# Ubuntu CD Image Automatic Signing Key (2012)
/usr/bin/gpg --no-default-keyring --keyring trustedkeys.gpg --keyid-format long --keyserver hkp://keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
# Ubuntu Archive Automatic Signing Key
/usr/bin/gpg --no-default-keyring --keyring trustedkeys.gpg --keyid-format long --keyserver hkp://keyserver.ubuntu.com --recv-keys 40976EAF437D05B5

# log finish
/bin/logger -t mirror [$$] Finished $SCRIPT_FILENAME
