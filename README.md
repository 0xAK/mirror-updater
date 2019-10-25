# mirror-updater
Collection of bash scripts to mirror desired bits of Linux repositories.  Designed to be dumped in $HOME of a user account which then calls $HOME/update-wrapper.sh from cron as desired.

Developed on CentOS 7.7.1908.

Prerequisties            CentOS Package     Tested version    CentOS repo
bash                     bash.x86_64        4.2.46-33.el7     @base
wget                     wget.x86_64        1.14-18.el7_6.1   @updates
gnupg2                   gnupg2.x86_64      2.0.22-5.el7_5    @base             
expect                   expect.x86_64      5.45-14.el7_1     @base
rsync                    rsync.x86_64       3.1.2-6.el7_6.1   @base
createrepo               createrepo.noarch  0.9.9-28.el7      @base

Files:

update-00-gpgkeys.sh:
Grab the updated GPG keys and import them into the account's keyring

update-XX-rsyncmodule.sh:
Bash script to do the rsync job.  Naming format designed so you have update-01-centos.sh, update-02-ubuntu.sh, etc.

rsync-include-update-XX-rsyncmodule.sh.txt:
Rsync include patterns for control over which subdirectories of the module you wish to copy.

update-99-create-centos-repos.sh:
This script uses createrepo(8) to create the CentOS repomd repositories once they exist on the local filesystem.

update-wrapper.sh:
Run all the files of "update-\*" sh within $HOME.  Suitable for placing into crontab.  

send_mail:
Expect script called by update-wrapper.sh to send an email report.
