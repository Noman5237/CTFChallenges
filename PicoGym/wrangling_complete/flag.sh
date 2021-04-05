# Clear dump
if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

# Download dump and operate
scriptLink=$1
wget --quiet $scriptLink -O ende.py

passwordLink=$2
wget --quiet $passwordLink -O passwordFile

encryptedFlagLink=$3
wget --quiet $encryptedFlagLink -O encryptedFlag

password=$(cat passwordFile)
flag=$(python ende.py -d encryptedFlag $password)

popd > /dev/null

# print the flag
echo $flag
