/etc/yum.repos.d/virtualbox.repo:
  file.managed:
    - source: salt://files/yum.repos.d/virtualbox.repo
    - user: root
    - group: root
    - mode: 644

