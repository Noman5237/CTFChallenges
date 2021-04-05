# Clear dump
if [ -d build/ ]
then
	rm -rf build/
fi

mkdir build
pushd build/ > /dev/null


# Download dump and operate
i=0
flag=""
webLink=$1
wget $webLink --quiet -O "file$i"
while :
do
	{
		unzip -qq -jp "file$(($i))" > "file$(($i+1))"
		errorCode=$?
		if [ $errorCode -eq 9 ]
		then
			flag=$(cat "file$(($i))")
			break
		fi
		i=$i+1
	} &> /dev/null
done

popd > /dev/null

# print the flag
echo $flag
