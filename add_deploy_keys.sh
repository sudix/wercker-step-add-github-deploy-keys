#!/bin/sh

makeConfig() {
    local ssh_dir=$1
    local config=$2

    if [ ! -d "$ssh_dir" ]; then
	mkdir -p $ssh_dir
    fi

    echo -e "\nHost github.com\n    StrictHostKeyChecking no" >> $config
    chmod 0600 $config
}

addIdentities() {
    local config=$1

    i=0
    while [ $i -ne 20 ]
    do
	i=`expr $i + 1`
	local key_name=$(eval echo "\$WERCKER_ADD_GITHUB_DEPLOY_KEYS_KEY${i}")
	if [ -n "${key_name}" ]; then
	    local private_key=$(eval echo '"$'$key_name'"');
	    local ssh_key_file=$(mktemp)
	    echo -e "${private_key}" > $ssh_key_file
	    chmod 0600 $ssh_key_file
	    echo "[Add key${i} `ssh-keygen -E md5 -lf $ssh_key_file`"
	    echo "    IdentityFile $ssh_key_file" >> $config
	fi
    done

    echo -e "\n-------- $config"
    cat $config
    echo "--------"
}

main () {
    makeConfig $1 $2
    addIdentities $2
}

main $1 $2;
