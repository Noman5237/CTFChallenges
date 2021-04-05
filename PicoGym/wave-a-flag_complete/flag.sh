# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate
webLink=$1
wget --quiet $webLink -O program

chmod +x ./program
output=$(./program -h)
flag=$(echo $output | grep -oE --color=never "picoCTF{.*}")

popd > /dev/null

# print the flag
echo $flag
