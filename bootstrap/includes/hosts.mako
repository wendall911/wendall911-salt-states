<%def name="host_file(machine_name, domain, ip_addr)">\
cat >/etc/hosts << 'EOL'
127.0.0.1 ${machine_name} localhost localhost4.localdomain4 localhost.localdomain localhost4
::1 ${machine_name} localhost localhost.localdomain localhost6 localhost6.localdomain6
${ip_addr} ${machine_name}.${domain}
EOL
</%def>\
