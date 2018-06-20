var curKey:int
var key:string = "CCC"
var outChar: char

proc main =
    # var infile = openAsync("/dev/stdin", fmRead)
    # let infile = open("/dev/stdin", fmRead)
    var charRead = stdin.readChar()
    while charRead > char(0):
        outChar = char(int(key[curKey]) xor int(charRead))
        write(stdout, outChar)
        curKey += 1
        curKey = curKey mod len(key)
        try:
            charRead = stdin.readChar()
        except:
            return

main()
