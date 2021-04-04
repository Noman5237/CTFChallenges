#!/usr/bin/env python3

import sys

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Arguments needed for generating flag!")
        sys.exit(1)

    rot13Str = sys.argv[1]
    shift = int(sys.argv[2])
    flag = ""
    for c in rot13Str:
        startOffset = 0
        if "z" >= c >= "a":
            startOffset = ord("a")
        elif "Z" >= c >= "A":
            startOffset = ord("A")
        
        if startOffset > 0:
            offset = ord(c)
            newOffset = (offset - startOffset + shift) % 26
            c = chr(startOffset + newOffset)

        flag += c
        

    print(flag)


