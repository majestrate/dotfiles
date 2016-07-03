#!/home/jeff/local/cjdns/v/bin/python
# -*- encoding: utf-8 -*-
#
from cjdns import connectWithAdminInfo as connect

def getxstr(x):
  x /= 8
  u = "K"
  if x > 1024:
    x /= 1024
    u = "M"
    if x > 1024:
      x /= 1024
      u = "G"
  return x, u

def prntbw(tx, rx, name='{}total'.format(' '*49)):
  tx, txu = getxstr(tx)
  rx, rxu = getxstr(rx)
  print('{} : ↑ %.2f %sBps | ↓ %.2f %sBps'.format(name)%(tx,txu,rx,rxu))
  
s = connect()
ps = s.InterfaceController_peerStats()
tx, rx = 0.0, 0.0
for p in ps['peers']:
  ptx = p['sendKbps']
  prx = p['recvKbps']
  pk = '{}.k'.format( p['addr'].split('.')[-2])
  prntbw(ptx, prx, pk)
  tx += ptx
  rx += prx

prntbw(tx, rx)
