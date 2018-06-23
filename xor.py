#!/usr/bin/env python2

from sys import argv

if len(argv) <= 1:
    print("Please enter key")
    exit(1)

def xor_crypt_string(data, key):
    from itertools import izip, cycle
    import base64
    xored = ''.join(chr(ord(x) ^ ord(y)) for (x,y) in izip(data, cycle(key)))
    return xored


with open('/dev/stdin') as f:
    while True:
        secret_data = f.read(4096)
        if not secret_data:
            break
        if secret_data =="":
            break
        print xor_crypt_string(secret_data, argv[1])
