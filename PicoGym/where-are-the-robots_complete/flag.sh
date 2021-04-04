if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
# Check the robots.txt page
robots="$webLink/robots.txt"
wget --quiet $robots
str=$(grep -oE --color=never "Disallow: (.*)" robots.txt)
regex="Disallow: (.*)"
if [[ $str =~ $regex ]]
then
    flagWebLink="$webLink${BASH_REMATCH[1]}"
fi
wget --quiet $flagWebLink -O flag.html
flag=$(grep -oE --color=never "picoCTF{.*}" flag.html)

popd > /dev/null

echo $flag

