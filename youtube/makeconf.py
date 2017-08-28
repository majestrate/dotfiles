#!/usr/bin/env python3
import sys
from xml.etree import ElementTree as ET

e = ET.parse(sys.argv[1])
root = e.getroot()[0][0]
for c in root.findall("outline"):
    txt = c.get("text")
    url = c.get("xmlUrl")
    print ("  youtube-{}:\n    rss:\n      url: {}".format(txt, url))
    print ("      other_fields: [date]")
    print ("    age:")
    print ("      field: rss_pubdate")
    print ("      action: reject")
    print ("      age: 1 day")
    print ("    template:")
    print ("      - youtube" )
    print()
