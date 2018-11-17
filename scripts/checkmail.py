#!/usr/bin/env python3
#
# simple mail checker script
#

from poplib import POP3 as POP
import netrc
import sys


def listMails(serv):
    rc = netrc.netrc()
    _, acc, passwd = rc.hosts[serv]
    p = POP(serv)
    p.stls()
    p.user(acc)
    p.pass_(passwd)
    num, _ = p.stat()
    p.quit()
    return num


server = len(sys.argv) > 1 and sys.argv[1] or None
if server:
    num = listMails(server)
    if num:
        print('{} new {}'.format(num, num > 1 and 'mails' or 'mail'))
    else:
        print('no new mail')
