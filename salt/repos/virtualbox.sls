virtualbox-repo:
  pkgrepo.managed:
    - humanname: Fedora $releasever - $basearch - VirtualBox
    - baseurl: http://download.virtualbox.org/virtualbox/rpm/fedora/$releasever/$basearch
    - gpgkey: http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc
    - gpgcheck: 1
