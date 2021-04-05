# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate
webLink=$1
wget --quiet $webLink -O crackme.py
sed -ie "$ s/choose_greatest()/decode_secret(bezos_cc_secret)/" crackme.py
flag=$(python crackme.py)

popd > /dev/null

# print the flag
echo $flag
