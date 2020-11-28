include:
  - packages.gcc
  - packages.meld
  - packages.git
  - packages.vim-enhanced
  - packages.subversion
  - packages.mercurial
  - packages.nginx
  - packages.nodejs

httpd_can_network_connect:
  selinux.boolean:
    - value: True
    - persist: True

nis_enabled:
  selinux.boolean:
    - value: True
    - persist: True
{%- endif %}
