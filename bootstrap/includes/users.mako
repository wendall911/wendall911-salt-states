<%def name="wendallc()">\
## Need to add our admin user here
ADMIN=wendallc
ADMIN_KEY=$(cat << 'EOL'
<%include file="/files/ssh/wendallc_id_rsa.pub"/>\
EOL
)
if ! id -u $ADMIN >/dev/null 2>&1; then
    add_user $ADMIN
    add_pub_key $ADMIN "$ADMIN_KEY"
    gpasswd -a wendallc wheel
fi
</%def>\

<%def name="saltmaster(machine_name)">\
GITHUB_FP=$(cat << 'EOL'
github.com,140.82.116.4 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=
EOL
)

## add our saltmaster user
if ! id -u ${machine_name} >/dev/null 2>&1; then
    KNOWN_HOSTS=/home/${machine_name}/.ssh/known_hosts
    add_user ${machine_name}
    echo "$GITHUB_FP">$KNOWN_HOSTS
    chown ${machine_name}:${machine_name} $KNOWN_HOSTS
    su ${machine_name} -c 'cd /home/${machine_name}; git clone --depth 1 https://github.com/wendall911/wendall911-salt-states.git wendall911-salt-states'
    su ${machine_name} -c 'cd /home/${machine_name}; git clone --depth 1 https://github.com/wendall911/ModrinthBadge-Unofficial.git modrinth.roughness.technology'
fi
</%def>\
