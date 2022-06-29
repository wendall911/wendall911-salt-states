openssh-server:
  pkg:
    - installed
  service:
    - running
    - name: sshd
    - enable: True
    - require:
      - file: /etc/ssh/sshd_config.d/50-redhat.conf
      - pkg: openssh-server
    - watch:
      - file: /etc/ssh/sshd_config.d/50-redhat.conf
      - pkg: openssh-server
