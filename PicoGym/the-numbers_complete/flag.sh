numbers=$@
flag=""
for number in ${numbers[@]}
do
	if [ $number != "{" ] && [ $number != "}" ]
	then
		number=$(expr $number + 64)
		flag+=$(printf "\x$(printf %x $number)")
	else
		flag+=$number
	fi
done

echo $flag
