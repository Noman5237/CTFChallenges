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

part1=$(grep -or --no-filename "\/\*.*\*\/" | cut -d" " -f3)
part2=$(grep -or --no-filename "// .*" | cut -d" " -f3)
flag="$part1$part2"

popd > /dev/null

# print the flag
echo $flag
