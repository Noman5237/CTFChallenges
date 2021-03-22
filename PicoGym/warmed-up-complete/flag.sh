# NOTE: output base always before input base
flag=$(echo "obase=10; ibase=16; 3D" | bc)
echo picoCTF{$flag}
