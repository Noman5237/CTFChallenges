#!/usr/bin/python

import click

morseDictionary = {
	"A": ".-",
        "N": "-.",	
	"B": "-...",
        "O": "---",
	"C": "-.-.",
        "P": ".--.",
	"D": "-..",
        "Q": "--.-",
	"E": ".",
        "R": ".-.",
	"F": "..-.",
        "S": "...",
	"G": "--.",
        "T": "-",
	"H": "....",
        "U": "..-",
	"I": "..",
        "V": "...-",
	"J": ".---",
        "W": ".--",
	"K": "-.-",
        "X": "-..-",
	"L": ".-..",
        "Y": "-.--",
	"M": "--",
        "Z": "--..",

        "1":".----",		
        "6":"-....",	
        "2":"..---",		
        "7":"--...",	
        "3":"...--",		
        "8":"---..",	
        "4":"....-",		
        "9":"----.",	
        "5":".....",		
        "0":"-----"
}


def decrypt(text):
    dec = ""
    tokens = text.split()
    morseCodes = list(morseDictionary.values())
    alphabet = list(morseDictionary.keys())
    for token in tokens:
        if token in morseCodes:
            dec += alphabet[morseCodes.index(token)]
        else:
            dec += token
    
    return dec

def encrypt(text):
    enc = []
    for letter in text:
        if letter in morseDictionary:
            enc.append(morseDictionary[letter])
        else:
            enc.append(letter)

    return " ".join(enc)


@click.command()
@click.option("-e", "--encrypt", "mode", flag_value='encrypt', help="Encrypt text with Morse Code")
@click.option("-d", "--decrypt", "mode", flag_value='decrypt', default=True, help="Decrypt text with Morse Code")
@click.option("-t", "--text", "text", required=True, help="Text to encrypt or decrypt")
def morse(mode, text):
    output = ""
    text = text.upper()
    if mode == "decrypt":
        output = decrypt(text)
    else:
        output = encrypt(text)
    
    print(output)

if __name__ == "__main__":
    morse()

