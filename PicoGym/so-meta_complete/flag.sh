if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null
webLink=$1
wget --quiet $webLink -O pico_image.png 
flag=$(exiftool -s -s -s -Artist pico_image.png)
popd > /dev/null

echo $flag
