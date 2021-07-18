#!/usr/bin/python

import click

alphabet = ""
table = []
index = {}


def rotate(l, n):
    return l[n:] + l[:n]


def setup(alphabetSet):
    global alphabet
    alphabet = list(alphabetSet)

    tableSize = len(alphabet)

    for i in range(tableSize):
        index[alphabet[i]] = i

    for i in range(tableSize):
        table.append(rotate(alphabet, i))


def encrypt(text, key):
    enc = ""
    for i in range(len(text)):
        enc += table[index[key[i]]][index[text[i]]]
    
    return enc


def decrypt(text, key):
    dec = ""
    for i in range(len(text)):
        keyRow = table[index[key[i]]]
        textCol = keyRow.index(text[i])
        dec += alphabet[textCol]

    return dec


@click.command()
@click.option("-e", "--encrypt", "mode", flag_value='encrypt', help="Vigenere Encrypt text with key")
@click.option("-d", "--decrypt", "mode", flag_value='decrypt', default=True, help="Vigenere Decrypt text with key")
@click.option("-t", "--text", "text", required=True, help="Text to encrypt or decrypt")
@click.option("-k", "--key", "key", required=True, help="Vigenere Key to encrypt or decrypt the text with")
@click.option("-a", "--alphabet", "alphabet", default="ABCDEFGHIJKLMNOPQRSTUVWXYZ", help="Alphabet set to construct the Vigenere table with")
def vigenereCipher(mode, text, key, alphabet):
    setup(alphabet)
    key = key * (len(text)//len(key) + 1)
    output = ""
    if mode == "decrypt":
        output = decrypt(text, key)
    else:
        output = encrypt(text, key)
    
    print(output)

if __name__ == "__main__":
    vigenereCipher()

