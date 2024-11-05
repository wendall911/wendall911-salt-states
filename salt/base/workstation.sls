include:
  - repos.copr
  - repos.google-chrome
  - repos.rpmfusion
  - repos.salt
  - users.admins
  - packages.sudo
  - packages.salt-minion
  - packages.fonts
  - packages.unison
  - packages.java
  - packages.screen
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'framework.localdomain' -%}
  - packages.thunderbird
  - packages.chrome
  - packages.gimp
  - packages.inkscape
  - packages.pylint
  {%- endif %}
  - packages.fedora-crap
  - packages.openssh-server
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'tjc.localdomain' or grains['fqdn'] == 'kathy.localdomain' or grains['fqdn'] == 'framework.localdomain' -%}
  - packages.calibre
  {%- endif %}
  {% if grains['fqdn'] == 'tjc.localdomain' or grains['fqdn'] == 'framework.localdomain' or grains['fqdn'] == 'wlaptop.localdomain' -%}
  - packages.telegram-desktop
  - packages.discord
  {%- endif %}
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'ashar.localdomain' or grains['fqdn'] == 'kieran.localdomain' or grains['fqdn'] == 'kathy.localdomain' or grains['fqdn'] == 'framework.localdomain' -%}
  - packages.steam
  - packages.prismlauncher
  {%- endif %}
  {% if grains['fqdn'] == 'ashar.localdomain' or grains['fqdn'] == 'framework.localdomain' -%}
  - packages.keyd
  {%- endif %}

/etc/dnf/dnf.conf:
  file.managed:
    - source: salt://files/dnf/dnf.conf
    - user: root
    - group: root
    - mode: 644

/etc/gdm/custom.conf:
  file.managed:
    - source: salt://files/gdm/custom.conf
    - user: root
    - group: root
    - mode: 644

{% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'framework.localdomain' -%}
/home/wendallc/tmp:
  file.directory:
    - user: wendallc
    - group: wendallc
    - mode: 755
    - makedirs: True
{%- endif %}
