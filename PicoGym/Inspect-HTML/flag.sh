# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
# Download dump and operate
wget -p --quiet $webLink
flag=$(grep -or --no-filename "picoCTF{.*}")

popd > /dev/null

# print the flag
echo $flag
