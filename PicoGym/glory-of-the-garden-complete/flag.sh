if [ -d build/ ]
then
	rm -rf build/
fi

mkdir build

pushd build/ > /dev/null

webLink=$1
wget -q $webLink
flag=$(strings garden.jpg | grep -oE --color=never "picoCTF{.*}")

popd > /dev/null

echo $flag
