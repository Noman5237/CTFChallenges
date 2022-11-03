# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate

popd > /dev/null

# print the flag
echo $flag
