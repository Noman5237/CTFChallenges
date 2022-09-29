# The username and password are obtained from the client side js code
# The website converts the field input to Base64 before comparing
# So reversing the compared string from Base64 to string produces the credentials
username="admin"
password="picoCTF{53rv3r_53rv3r_53rv3r_53rv3r_53rv3r}"
echo "$password"
