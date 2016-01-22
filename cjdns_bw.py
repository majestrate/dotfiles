#!/usr/bin/env python
# -*- encoding: utf-8 -*-
#
from cjdnsadmin import connectWithAdminInfo as connect

s = connect()
ps = s.InterfaceController_peerStats()
tx, rx = 0.0, 0.0
for p in ps['peers']: 
  tx += p['sendKbps']
  rx += p['recvKbps']

tx /= 8
rx /= 8

txu = "K"
if tx > 1024:
  tx /= 1024
  txu = "M"
  if tx > 1024:
    tx /= 1024
    txu = "G"

rxu = "K"
if rx > 1024:
  rx /= 1024
  rxu = "M"
  if rx > 1024:
    rx /= 1024
    rxu = "G"

print('↑ %.2f %sBps | ↓ %.2f %sBps'%(tx,txu,rx,rxu))
