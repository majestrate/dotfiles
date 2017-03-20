#!/usr/bin/env bash
set -x
files="$1"
name="$2"
unescaped="$3"
path="'${unescaped:7}'"
localpath=`echo "$path" | sha256sum | cut -d' ' -f1`
torrent=/tmp/$localpath.torrent
scp torrents:"$path" $torrent
snark=/mnt/storage/contents/i2psnark/i2psnark/
cp -av "$files" "$snark"
export http_proxy=http://127.0.0.1:4444/
url="`curl --basic -n -F"torrent-name=$name" -F"torrent-file=@$torrent" 'http://anodex.i2p/c/3/?t=json' | jq '.URL'`"
if [ "$url" = "null" ]; then
    exit 1
fi
wget `echo $url | sed s/\"//g` -O "$snark/$localpath.txt" && mv "$snark/$localpath.txt" "$snark/$localpath.torrent"
