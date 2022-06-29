include:
  - packages.gcc
  - packages.meld
  - packages.git
  - packages.vim-enhanced
  - packages.nodejs
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'framework.localdomain' -%}
  - repos.slack
  - packages.utils
  - packages.sway-desktop
  - packages.seahorse
  {%- endif %}
