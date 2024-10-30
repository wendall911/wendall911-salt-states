salt-latest:
  pkgrepo.managed:
    - humanname: Salt repo for RHEL/CentOS $releasever PY3
    - baseurl: https://repo.saltproject.io/salt/py3/redhat/$releasever/$basearch/3007
    - gpgkey: https://repo.saltproject.io/salt/py3/redhat/$releasever/$basearch/3007/SALT-PROJECT-GPG-PUBKEY-2023.pub
    - gpgcheck: 1
