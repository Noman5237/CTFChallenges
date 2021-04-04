if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null
webLink=$1
wget --quiet $webLink -O ciphertext
encryptedFlag=$(grep -o "{.*}" --color=never ciphertext)

for i in {1..26}
do
	possibleFlag=$(../caesar.py $encryptedFlag $i)
	echo "picoCTF$possibleFlag"
done

popd > /dev/null

