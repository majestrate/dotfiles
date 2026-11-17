#!/bin/bash
set -x
src=$(dirname $0)/bind
dst=/var/lib/bind

# if any zone file is not yet in $dst it is a new zone, so named needs a
# full restart to pick up its named.conf.local entry; otherwise a reload is enough
action=reload
for zone in "$src"/*.zone ; do
    if [ ! -e "$dst/$(basename "$zone")" ] ; then
        action=restart
    fi
done

cp -av "$src"/*.zone "$dst"/ || exit
systemctl $action named
