#!/bin/bash
SCRIPT_FILENAME=$(basename "$0")
$PREFIX=/some/dir
# log start
/bin/logger -t mirror [$$] Started $SCRIPT_FILENAME

## create repos
/bin/createrepo -g comps.xml $PREFIX/centos/6/os/x86_64/
/bin/createrepo -g comps.xml $PREFIX/centos/6/os/i386
/bin/createrepo $PREFIX/centos/6/extras/x86_64/
/bin/createrepo $PREFIX/centos/6/extras/i386/
/bin/createrepo $PREFIX/centos/6/updates/x86_64/
/bin/createrepo $PREFIX/centos/6/updates/i386/
/bin/createrepo -g comps.xml $PREFIX/centos/7/os/x86_64/
/bin/createrepo $PREFIX/centos/7/extras/x86_64/
/bin/createrepo $PREFIX/centos/7/updates/x86_64/
/bin/createrepo $PREFIX/centos/7/centosplus/x86_64/
/bin/createrepo -g comps.xml $PREFIX-centos/8/BaseOS/x86_64/os/
/bin/createrepo $PREFIX/centos/8/extras/x86_64/os/
/bin/createrepo $PREFIX/centos/8/AppStream/x86_64/os/
/bin/createrepo -g comps.xml $PREFIX/epel/6/x86_64/
/bin/createrepo -g comps.xml $PREFIX/epel/6/i386/
/bin/createrepo -g comps.xml $PREFIX/epel/7/x86_64/
/bin/createrepo -g comps.xml $PREFIX/epel/8/Everything/x86_64/

# log finish
/bin/logger -t mirror [$$] Finished $SCRIPT_FILENAME
