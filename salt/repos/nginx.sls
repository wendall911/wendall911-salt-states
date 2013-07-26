/etc/yum.repos.d/nginx.repo:
  file.managed:
    - source: salt://files/yum.repos.d/nginx.repo
    - user: root
    - group: root
    - mode: 644
