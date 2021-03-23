if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
wget --quiet $webLink

regex="password.charAt\((.*)\)\s*==\s*'(.*)'"
matches=($(grep -oE --color=never $regex VaultDoor1.java | tr -d " "))
matchesLen=${#matches[@]}
flagChars=()
for match in ${matches[@]}
do
	if [[ $match =~ $regex ]]
	then
		eval "flagChars[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}"
	fi

done

flag=""
for char in ${flagChars[@]}
do
	flag+=$char
done

popd > /dev/null

echo picoCTF{$flag}

