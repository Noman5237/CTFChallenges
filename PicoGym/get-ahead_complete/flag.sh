# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate
webLink=$1
header=$(curl --head -s $webLink)
flag=$(echo $header | grep -oE --color=never "picoCTF{.*}")

popd > /dev/null

# print the flag
echo $flag
