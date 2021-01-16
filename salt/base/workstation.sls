include:
  - repos.flash
  - repos.google-chrome
  - repos.rpmfusion
#  - repos.virtualbox
  - users.admins
  - packages.sudo
  - packages.salt-minion
  - packages.gnome-tweak-tool
  - packages.fonts
  - packages.flash-plugin
  - packages.unison
  - packages.java
  - packages.screen
  {% if grains['fqdn'][0] == 'w' -%}
  - packages.thunderbird
  - packages.chrome
  - packages.gimp
  - packages.inkscape
  - packages.pylint
  - packages.gnome-shell-extension-system-monitor-applet
  - packages.gnome-shell-extensions
  - packages.barrier
  {%- endif %}
  - packages.fedora-crap
  - packages.hplip-gui
  - packages.openssh-server
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'tjc.localdomain' or grains['fqdn'] == 'kathy.localdomain' -%}
  - packages.calibre
  {%- endif %}
  {% if grains['fqdn'] == 'tjc.localdomain' -%}
  - packages.telegram-desktop
  - packages.discord
  {%- endif %}
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'ashar.localdomain' or grains['fqdn'] == 'kieran.localdomain' or grains['fqdn'] == 'kathy.localdomain' -%}
  - packages.steam
  {%- endif %}
  - packages.ntp
  - packages.totem
  {% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'ashar.localdomain' or grains['fqdn'] == 'wthinkpad.localdomain' or grains['fqdn'] == 'wgazelle.localdomain' -%}
  - repos.skype
  - packages.skype
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
