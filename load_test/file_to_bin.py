import base64
import re

with open("im1.jpg", "rb") as f:
  encoded_string = base64.encodestring(f.read())
  out_file = open("out.csv", "w")
  out_file.write(str(encoded_string))
  #out_file.write(",pampers,diaper,family,baby")
  out_file.close()

with open("out.csv", "rb") as f:
  altchars=b'+/'
  all_data = f.read()
  data = all_data.split(b'=')
  #data = re.sub(rb'[^a-zA-Z0-9%s]+' % altchars, b'', data)  # normalize
  #print(data)
  encoded_data = data[0] + b'=='
  print(encoded_data)
  decoded_data = base64.decodestring(encoded_data)
  out_file = open("out.jpg", "wb")
  out_file.write(decoded_data)
  out_file.close()