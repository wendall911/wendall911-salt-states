modrinth-badge:
  service:
    - running
    - enable: True
    - require:
      - file: /etc/systemd/system/modrinth-badge.service
      - pkg: python3-gunicorn
    - watch:
      - file: /etc/systemd/system/modrinth-badge.service
      - pkg: python3-gunicorn

/etc/systemd/system/modrinth-badge.service:
  file.managed:
    - source: salt://files/services/modrinth-badge.service
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: python3-gunicorn
