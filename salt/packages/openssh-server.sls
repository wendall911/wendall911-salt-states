openssh-server:
  pkg:
    - installed
  service:
    - running
    - name: sshd
    - enable: True
    - require:
      - file: /etc/ssh/sshd_config
      - pkg: openssh-server
    - watch:
      - file: /etc/ssh/sshd_config
      - pkg: openssh-server

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://files/ssh/sshd_config
    - user: root
    - group: root
    - mode: 600
    - template: jinja
    - require:
      - pkg: openssh-server
