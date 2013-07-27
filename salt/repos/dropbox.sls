/etc/yum.repos.d/dropbox.repo:
  file.managed:
    - source: salt://files/yum.repos.d/dropbox.repo
    - user: root
    - group: root
    - mode: 644


