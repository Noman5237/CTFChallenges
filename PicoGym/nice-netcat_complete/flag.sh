port=$1
numbers=($(nc mercury.picoctf.net $port | tr -d '\n'))
flag=""
for number in ${numbers[@]}
do
	if [ $number != "{" ] && [ $number != "}" ]
	then
		flag+=$(printf "\x$(printf %x $number)")
	else
		flag+=$number
	fi
done

echo $flag
