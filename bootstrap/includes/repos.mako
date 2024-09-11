<%def name="epel()">\
yum install -y http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
</%def>\
<%def name="fedora()">\
cat >/etc/yum.repos.d/salt-latest.repo << 'EOL'
[salt-latest]
baseurl=https://repo.saltproject.io/salt/py3/fedora/$releasever/$basearch/3006
gpgkey=https://repo.saltproject.io/salt/py3/fedora/$releasever/$basearch/3006/SALT-PROJECT-GPG-PUBKEY-2023.pub
gpgcheck=1
priority=1
name=Salt repo for Fedora $releasever PY3
enabled=1
EOL
</%def>\
