include:
  - packages.gcc
  - packages.meld
  - packages.git
  - packages.vim-enhanced
  - packages.nodejs
  {% if grains['fqdn'][0] == 'w' or grains['fqdn'] == 'framework.localdomain' -%}
  - packages.utils
  - packages.sway-desktop
  - packages.seahorse
  {%- endif %}

{% if grains['fqdn'] == 'wdesktop.localdomain' -%}
repousers:
  group.present
    - addusers:
      - wendallc
      - sandbox

devrepo_permissions:
  file.directory:
    - name: /srv/Repos
    - user: root
    - group: repousers
    - mode: '2775'
    - makedirs: True
    - require:
      - group: repousers

devrepo_shared_label:
  selinux.fcontext_policy_present:
    - name: '/srv/Repos(/.*)?'
    - sel_type: public_content_rw_t
    - filetype: 'a'
    - require:
      - file: devrepo_permissions

devrepo_apply_label:
  selinux.fcontext_policy_applied:
    - name: '/srv/Repos(/.*)?'
    - recursive: True
    - require:
      - selinux: devrepo_shared_label
      - file: devrepo_permissions
{%- endif %}
