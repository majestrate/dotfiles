import oxenc
import binascii
import sys
import requests


for addr in sys.argv[1:]:
  
  snodes = set()

  resp = requests.post('https://public.loki.foundation/json_rpc', json={'jsonrpc':'2.0', 'id':'0', 'method':'get_service_nodes', 'params':{'service_node_pubkeys':[]}})
  for snode in resp.json().get('result').get('service_node_states', []):
    if snode.get('operator_address') == addr:
      snodes.add(snode.get('pubkey_ed25519'))
    

  print(f"# pin edges to use oper {addr}")
  print('[network]')
  for line in snodes:
    print('strict-connect={}.snode'.format(oxenc.to_base32z(binascii.unhexlify(line.strip()))))
