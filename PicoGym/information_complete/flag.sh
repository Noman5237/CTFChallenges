# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate
webLink=$1

wget $webLink --quiet -O "cat.jpg"
flagBase64=$(exiftool -License -s -s -s "cat.jpg")
flag=$(echo $flagBase64 | base64 -d)

popd > /dev/null

# print the flag
echo $flag
