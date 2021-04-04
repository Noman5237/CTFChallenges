if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
wget --quiet $webLink -O strFile
flag=$(strings strFile | grep --color=never "picoCTF")

popd > /dev/null

echo $flag

