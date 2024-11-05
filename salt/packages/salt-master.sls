salt-master:
  pkg:
    - installed

/etc/salt/master:
  file.managed:
    - source: salt://files/salt/master
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: salt-master
