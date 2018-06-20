var buf: cstring

var key: cstring  = "abc"

proc encrypt =
  var l = readBuffer(stdin, buf, 4096)
  while l > 0:
    for i in 0..<l:
      buf[i] = char(int(buf[i]) xor int(key[i mod len(key)]))
    l = readBuffer(stdin, buf, 4096)

proc decrypt =
  encrypt()

encrypt()
