ntpsec:
  pkg:
    - installed
  service:
    - running
    - name: ntpd
    - enable: True
    - require:
      - file: /etc/localtime
      - pkg: ntpsec
    - watch:
      - file: /etc/localtime
      - pkg: ntpsec

/etc/localtime:
  file.symlink:
    - target: /usr/share/zoneinfo/America/Los_Angeles
    - force: True
    - require:
      - pkg: ntpsec
