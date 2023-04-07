#!/bin/bash
cp -av $(dirname $0)/bind/*.zone /var/lib/bind/
systemctl reload named
