#!/usr/bin/env python

from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

rootdir = '/var/www'
auth = DummyAuthorizer()
with open('/root/ftpauth.txt') as f:
    for line in f:
        line = line.strip()
        if line.startswith('#'):
            continue
        if ':' in line:
            idx = line.index(':')
            user, passwd = line[:idx], line[1+idx:]
            auth.add_user(user, passwd, rootdir, perm="xelradfmw")
auth.add_anonymous(rootdir)
handler = FTPHandler
handler.authorizer = auth
server = FTPServer(('ocean.hype', 21), handler)
server.serve_forever()
