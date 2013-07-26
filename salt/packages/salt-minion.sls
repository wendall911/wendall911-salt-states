salt-minion:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - file: /etc/salt/minion
      - pkg: salt-minion
    - watch:
      - file: /etc/salt/minion
      - pkg: salt-minion

/etc/salt/minion:
  file.managed:
    - source: salt://files/salt/minion
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt-minion
