include:
  - repos.flash
  - repos.google-chrome
  - repos.rpmfusion
  - repos.virtualbox
  - users.admins
  - packages.sudo
  - packages.salt-minion
  - packages.gnome-tweak-tool
  - packages.fonts
  - packages.flash-plugin
  - packages.unison
  - packages.java
  {% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' -%}
  - packages.thunderbird
  - packages.chrome
  - packages.gimp
  - packages.inkscape
  - packages.pylint
  {%- endif %}
  - packages.gnome-shell-extension-alternate-tab
  - packages.fedora-crap
  - packages.hplip-gui
  - packages.openssh-server
  {% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' or grains['fqdn'] == 'tjc.localdomain' -%}
  - packages.calibre
  {%- endif %}
  {% if grains['fqdn'] == 'wlaptop.localdomain' -%}
  - packages.pidgin
  {%- endif %}
  {% if grains['fqdn'] == 'kathy.localdomain' -%}
  - packages.vlc
  {%- endif %}


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
{%- endif %}

