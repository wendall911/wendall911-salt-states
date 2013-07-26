salt-master:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - file: /etc/salt/master
      - pkg: salt-master
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
