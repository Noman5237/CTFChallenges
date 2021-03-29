if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null
webLink="$1flag"
wget --user-agent="picobrowser" --quiet $webLink -O flag.html
flag=$(grep -o "picoCTF{.*}" --color=never flag.html)
popd > /dev/null

echo $flag
