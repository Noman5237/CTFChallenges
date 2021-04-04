if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
wget --quiet $webLink -O file
flag=$(grep -o "picoCTF{.*}" --color=never file)

popd > /dev/null

echo $flag
