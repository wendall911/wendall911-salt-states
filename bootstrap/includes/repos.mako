<%def name="salt()">\
cat >/etc/yum.repos.d/salt-latest.repo << 'EOL'
[salt-latest]
baseurl=https://packages.broadcom.com/artifactory/saltproject-rpm/
gpgkey=https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public
gpgcheck=1
name=Salt Repo for Salt v3007 STS
enabled=1
priority=1
exclude=['*3006*', '*3008*', '*3009*', '*3010*']
skip_if_unavailable=1
EOL
</%def>\
