/etc/yum.repos.d/adobe-linux-i386.repo:
  file.managed:
    - source: salt://files/yum.repos.d/adobe-linux-i386.repo
    - user: root
    - group: root
    - mode: 644

