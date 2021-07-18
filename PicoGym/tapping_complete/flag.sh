# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
port=$2

morseText=$(nc $webLink $port)
flag=$(~/Links/CTF-tools/crypto/morse.py -d -t "$morseText")

popd > /dev/null

# print the flag
echo $flag
