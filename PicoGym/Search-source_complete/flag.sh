# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
wget -p --quiet $webLink
flag=$(grep -or --no-filename --color=never picoCTF{.*})

popd > /dev/null

# print the flag
echo $flag
