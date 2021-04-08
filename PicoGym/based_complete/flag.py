#!/usr/bin/python

from pwn import * 
from re import compile 

def convertNumListToWord(numList, base):
    word = ""
    for num in numList:
        word += chr(int(num, base=base))

    return word

def produceNumList(wordBlob):
    regex = compile("Please\\s+give\\s+(me )?the\\s+(.*)\\s+as\\s+a\\s+word")
    match = regex.search(wordBlob)
    numListStr = match.group(2)
    numList = None
    if " " in numListStr:
        numList = match.group(2).split(" ")
    else:
        numList = [numListStr[i:i+2] for i in range(0, len(numListStr), 2)]

    return numList

def inputWord(r, word):
    r.sendlineafter("Input:\n", word)

if __name__ == "__main__":
    server = sys.argv[1]
    port = sys.argv[2]
    r = remote(server, port, level="error")
    
    # First Binary 
    wordBlob = r.recvuntilS("as a word")
    word = convertNumListToWord(produceNumList(wordBlob), 2)
    inputWord(r, word)
    
    # Next Octal 
    wordBlob = r.recvuntilS("as a word")
    word = convertNumListToWord(produceNumList(wordBlob), 8)
    inputWord(r, word)

    # At last hexadecimal
    wordBlob = r.recvuntilS("as a word")
    word = convertNumListToWord(produceNumList(wordBlob), 16)
    inputWord(r, word)
    
    # We then receive the flag
    r.recvline()
    flagLine = r.recvlineS()
    startIndex = flagLine.find("picoCTF")
    flag = flagLine[startIndex:]
    print(flag, end="")

