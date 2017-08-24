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
  - packages.screen
  {% if grains['fqdn'][0] == 'w' -%}
  - repos.hipchat
  - packages.hipchat
  - packages.thunderbird
  - packages.chrome
  - packages.gimp
  - packages.inkscape
  - packages.pylint
  - packages.quicksynergy
  - packages.gnome-shell-extensions
  {%- endif %}
  - packages.gnome-shell-extension-alternate-tab
  - packages.fedora-crap
  - packages.hplip-gui
  - packages.openssh-server
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'tjc.localdomain' or grains['fqdn'] == 'kathy.localdomain' -%}
  - packages.calibre
  {%- endif %}
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'ashar.localdomain' -%}
  - packages.steam
  {%- endif %}
  - packages.ntp
  - packages.totem
  {% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'ashar.localdomain' -%}
  - repos.skype
  - packages.skype
  {%- endif %}
