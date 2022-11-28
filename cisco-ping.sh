function controlSee() {
        exit
}

trap controlSee SIGINT

while :; do
        d=$(date +"%Y%m%d-%H%M%S")
        echo -n "${d}: "
        for x in $(seq $(($(tput cols)-$(echo ${d} | wc -c)-3))); do
                if ping -q -A -c 1 -t 1 ${1} >/dev/null; then
                        echo -n "!"
                else 
                        echo -n "."
                fi
        done
        echo
done
