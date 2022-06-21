R='\033[31m'
GRE='\033[32m'
W='\033[37m'


function inuse() {
	check=$(curl -s -i "https://www.github.com/${username}" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

	if [[ $check == *'1'* ]] ; then 
		echo -e "${R}Unavailible! - ${W}${username}\n"

	elif [[ $check == *'0'* ]]; then 
		echo -e "${GRE}Available! - ${W}${username} - Adding to list of useable names\n"
		echo "${username}" >> names.txt
	fi
}

while :
do
	read username
	inuse
done