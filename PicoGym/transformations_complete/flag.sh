# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate
webLink=$1
wget --quiet $webLink -O file

encryptedFlag=$(iconv -f utf-8 -t utf-16le file)
flag=$(python ../decrypt.py $encryptedFlag)

popd > /dev/null

# print the flag
echo $flag
