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
github.com,207.97.227.239 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
EOL
)

## add our saltmaster user
if ! id -u ${machine_name} >/dev/null 2>&1; then
    KNOWN_HOSTS=/home/${machine_name}/.ssh/known_hosts
    add_user ${machine_name}
    echo "$GITHUB_FP">$KNOWN_HOSTS
    chown ${machine_name}:${machine_name} $KNOWN_HOSTS
    su ${machine_name} -c 'cd /home/${machine_name}; git clone --depth 1 https://github.com/wendall911/wendall911-salt-states.git wendall911-salt-states'
fi
</%def>\

<%def name="wcada()">\
## Need to add our admin user here
ADMIN=wcada
ADMIN_KEY=$(cat << 'EOL'
<%include file="/files/ssh/wendallc_id_rsa.pub"/>\
EOL
)
add_pub_key $ADMIN "$ADMIN_KEY"
</%def>\
