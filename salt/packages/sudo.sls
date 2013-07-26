sudo:
  pkg.installed

/etc/sudoers:
  file.managed:
    - source: salt://files/sudo/sudoers
    - user: root
    - group: root
    - mode: 440
