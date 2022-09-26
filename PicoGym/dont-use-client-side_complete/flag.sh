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
flag=$(grep -or --no-filename ", split.*" | awk '{$1=$1} {sub(/split\)/,"split*1)")} {print $0}' | sort | awk -F"'" '{print $2}' | paste -sd "" -)

popd > /dev/null

# print the flag
echo $flag
