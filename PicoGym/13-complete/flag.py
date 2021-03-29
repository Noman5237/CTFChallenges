#!/usr/bin/env python3

import sys

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Argument needed for generating flag!")
        sys.exit(1)

    rot13Str = sys.argv[1]
    flag = ""
    for c in rot13Str:
        startOffset = 0
        if "z" >= c >= "a":
            startOffset = ord("a")
        elif "Z" >= c >= "A":
            startOffset = ord("A")
        
        if startOffset > 0:
            offset = ord(c)
            newOffset = (offset - startOffset + 13) % 26
            c = chr(startOffset + newOffset)

        flag += c
        

    print(flag)


