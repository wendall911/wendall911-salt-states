ntp:
  pkg:
    - installed
  service:
    - running
    - name: ntpd
    - enable: True
    - require:
      - file: /etc/localtime
      - pkg: ntp
    - watch:
      - file: /etc/localtime
      - pkg: ntp

/etc/localtime:
  file.symlink:
    - target: /usr/share/zoneinfo/America/Los_Angeles
    - force: True
    - require:
      - pkg: ntp
