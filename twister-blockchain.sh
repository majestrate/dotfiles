#!/usr/bin/env bash

rm -rf /tmp/twister-blockchain
mkdir -p /tmp/twister-blockchain
cp -r /home/jeff/.twister/{blocks,chainstate} /tmp/twister-blockchain
cd /tmp/twister-blockchain
tar -czvf /tmp/twister-blockchain.tar.gz .
scp /tmp/twister-blockchain.tar.gz root@i2p.rocks:/var/www/html/files/
