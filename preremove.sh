#!/bin/sh
# This file has been automatically generated by cygbuild
# This script removes configuration files. New ones
# are installed afterwards by postinstall script.

set -e

PATH=/bin:/sbin:/usr/bin:/usr/sbin
LC_ALL=C
dest=$1  # Only used for testing

echo "$0: Removing unmodified configuration files."

fromdir=/etc/defaults
for file in  etc/X11/appbar/appbar.rc
do
    prev="$fromdir/$file.prev"
    current="$fromdir/$file"
    to="$dest/$file"

    if [ ! -e "$prev" ]; then        # First installation
        rm -vf "$to"
        cp -vf "$current" "$prev"
        continue
    fi

    if [ -e "$to" ]; then            # Next installations
        if cmp --quiet "$prev" "$to" ; then
            echo "$0: $to hasn't been modified, will update"
            rm -vf "$to"
        fi
    fi

    cp -vf "$current" "$prev"

done

# End of file

