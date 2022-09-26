# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1

# Download dump and operate
wget -p --quiet $webLink
wget --quiet $webLink/.htaccess
wget --quiet $webLink/.DS_Store

firstPart=$(grep -ori --no-filename "picoCTF{\w")
secondPart=$(grep -ori --no-filename "part [0-9]: .*" | cut -d" " -f2- | sort | cut -d" " -f2 | paste -sd "" -)
flag="$firstPart$secondPart"

popd > /dev/null

# print the flag
echo $flag
