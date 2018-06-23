import os

# let defKey*: string = "HELLO"
var buf: array[4096, char]

let argv = commandLineParams()

if len(argv) <= 0:
  echo "Please enter key"
  quit(QuitFailure)

let key = argv[0]

var keyPos: int = 0

var bytesRead = readChars(stdin, buf, 0, len(buf))
while bytesRead > 0:
  var i:int = 0
  while i < bytesRead:
    buf[i] = char(int(buf[i]) xor int(key[i mod len(key)]))
    inc(i)
  discard writeChars(stdout, buf, 0, bytesRead)
  bytesRead = readChars(stdin, buf, 0, len(buf))
