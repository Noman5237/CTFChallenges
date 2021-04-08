import sys

if __name__ == "__main__":
    flag = sys.argv[1]
    decryptedFlag = ''.join([flag[i + 1] + flag[i] for i in range(0, len(flag), 2)])
    print(decryptedFlag )

