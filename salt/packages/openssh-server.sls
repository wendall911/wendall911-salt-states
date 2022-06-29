openssh-server:
  pkg:
    - installed
  service:
    - running
    - name: sshd
    - enable: True
