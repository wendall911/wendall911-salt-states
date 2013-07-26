<%def name="saltmaster(machine_name)">\
cat >/etc/salt/master << 'EOL'
<%include file="/files/salt/master"/>\
EOL
sed -i 's|{{grains\["host"\]}}|${machine_name}|g' /etc/salt/master
</%def>\
<%def name="saltminion()">\
cat >/etc/salt/minion << 'EOL'
<%include file="/files/salt/minion"/>\
EOL
</%def>\
