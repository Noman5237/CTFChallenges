if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null
webLink=$1
wget -p --quiet $webLink

flags=( $(grep -oEr --color=never --no-filename "of the flag.*") )
flag=""
for i in ${!flags[@]}
do
	if [ ${flags[$i]} = "flag:" ]
	then
		flag+=${flags[$i+1]}
	fi
done
popd > /dev/null

echo $flag
