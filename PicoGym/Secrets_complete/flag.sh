# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
# Download dump and operate
wget -p "$webLink""secret/hidden/superhidden/" --quiet
flag=$(grep -or --no-filename --color=never picoCTF{.*})

popd > /dev/null

# print the flag
echo $flag
