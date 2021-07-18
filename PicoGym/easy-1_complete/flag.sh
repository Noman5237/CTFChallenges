# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

text=$1
key=$2

flag="picoCTF{$(~/Links/CTF-tools/crypto/vigenere.py -d -t ${text} -k ${key})}"

popd > /dev/null

# print the flag
echo $flag
