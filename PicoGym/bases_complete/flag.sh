enc=$1
flag="picoCTF{$(echo $enc | base64 -d)}"
echo $flag
