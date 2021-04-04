if [ -d build/ ]
then
    rm -rf build/
fi

mkdir build
pushd build/ > /dev/null

webLink=$1
wget --quiet $webLink

str=$(grep -oE --color=never "password.equals.*" VaultDoorTraining.java)
regex="password.equals\(\"(\w+)"
if [[ $str =~ $regex ]]
then
    flag="${BASH_REMATCH[1]}"
fi
popd > /dev/null

echo picoCTF{$flag}
