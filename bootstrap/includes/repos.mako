<%def name="epel()">\
cat >/etc/yum.repos.d/epel.repo << 'EOL'
<%include file="/files/yum.repos.d/epel.repo"/>\
EOL
</%def>\
