/etc/pki/rpm-gpg/saltstack-signing-key:
  file.managed:
    - source: salt://files/gpg/saltstack-signing-key
    - user: root
    - group: root
    - mode: 644
salt-latest:
  pkgrepo.managed:
    - humanname: SaltStack Latest Release Channel for RHEL/Centos $releasever
    - baseurl: https://repo.saltstack.com/yum/redhat/7/$basearch/latest
    - gpgkey: file:///etc/pki/rpm-gpg/saltstack-signing-key
    - gpgcheck: 1
