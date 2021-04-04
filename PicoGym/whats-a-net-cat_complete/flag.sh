webLink=$1
port=$2

flag=$(nc $webLink $port | grep "picoCTF{.*}")
echo $flag
