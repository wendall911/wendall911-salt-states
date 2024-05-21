keyd:
  pkg:
    - installed
  service:
    - running
    - name: keyd
    - enable: True
    - require:
      - file: /etc/keyd/default.conf
    - watch:
      - file: /etc/keyd/default.conf

/etc/keyd/default.conf:
  file.managed:
    - source: salt://files/keyd/default.conf
    - user: root
    - group: root
    - mode: 644
