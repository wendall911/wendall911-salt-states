include:
  - packages.gcc
  - packages.meld
  - packages.git
  - packages.vim-enhanced
  - packages.subversion
  - packages.mercurial
  - packages.couchdb
  - packages.nginx
  - packages.nodejs

{% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' -%}
/etc/couchdb/local.ini:
  file.managed:
    - source: salt://files/couchdb/local.ini
    - user: couchdb
    - group: couchdb
    - mode: 644
    - template: jinja
    - require:
      - pkg: couchdb

/etc/nginx/conf.d/couchdb.conf:
  file.managed:
    - source: salt://files/nginx/couchdb.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx
    - defaults:
      {% if grains['fqdn'] == 'wdesktop.localdomain' -%}
      ip_addr: 10.1.10.250
      {%- endif %}
      {% if grains['fqdn'] == 'wlaptop.localdomain' -%}
      ip_addr: 10.1.10.249
      {%- endif %}

httpd_can_network_connect:
  selinux.boolean:
    - value: True
    - persist: True

nis_enabled:
  selinux.boolean:
    - value: True
    - persist: True
{%- endif %}
