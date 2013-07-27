include:
  - repos.dropbox
  - repos.flash
  - repos.google-chrome
  - repos.rpmfusion
  - repos.virtualbox
  - users.admins
  - packages.sudo
  - packages.ntp
  - packages.salt-minion
  - packages.gnome-tweak-tool
  - packages.fonts
  {% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' -%}
  - packages.thunderbird
  {%- endif %}
  - packages.gnome-shell-extension-alternate-tab
  - packages.fedora-crap
