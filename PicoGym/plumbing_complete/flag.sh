server=$1
port=$2
flag=$(nc $server $port | grep -oE --color=never "picoCTF{.*}")
echo $flag
