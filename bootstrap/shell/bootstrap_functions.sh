##Functions

add_pub_key() {
    keyfile=/home/$1/.ssh/authorized_keys
    echo "$2">$keyfile
    chown $1:$1 $keyfile
    chmod 0600 $keyfile
}

add_priv_key() {
    keyfile=/home/$1/.ssh/id_rsa
    echo "$2">$keyfile
    chown $1:$1 $keyfile
    chmod 0400 $keyfile
}


add_user() {
    SSH_DIR=/home/$1/.ssh
    PASS=weonlyallowsshkeyaccess
    useradd -p `openssl passwd -1 $PASS` $1
    mkdir $SSH_DIR
    chown $1:$1 $SSH_DIR
    chmod 0700 $SSH_DIR
}
