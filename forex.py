#!/usr/bin/env python3

import requests
from datetime import datetime
import sys

YEAR = int(sys.argv[1])

r = requests.get('https://api.coingecko.com/api/v3/coins/loki-network/market_chart?vs_currency=usd&days=max').json()

for time, price in r['prices']:
    date = datetime.utcfromtimestamp(time/1000)
    if date.year == YEAR:
        print("{},{}".format(date.strftime("%Y-%m-%d"), price))
