salt-master:
  pkg.installed:
    - fromrepo: essentialed-centos
  service:
    - running
    - enable: True
    - require:
      - file: /etc/salt/master
      - pkg: salt-master
      - file: /etc/yum.repos.d/essentialed.repo
    - watch:
      - file: /etc/salt/master
      - pkg: salt-master

/etc/salt/master:
  file.managed:
    - source: salt://files/salt/master
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: salt-master
