include:
  - users.admins
  - repos.epel
  - packages.sudo
  - packages.ntp
  - packages.git
  - packages.salt-minion
  - packages.httpd
  - packages.openssh-server

/etc/hosts:
  file.managed:
    - source: salt://files/network/hosts
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - order: 1
    - defaults:
      my_host: {{ grains['host'] }}
      my_fqdn: "{{ grains['host'] }}.83864.com"
