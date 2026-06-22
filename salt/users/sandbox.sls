{% set my_user = 'sandbox' %}
{% set my_fullname = 'Development Application Sandbox' %}

{{ my_user }}:
  user.present:
    - fullname: {{ my_fullname }}
    - shell: /bin/bash
    - home: /home/{{ my_user }}

{{ my_user }}_gdm_mask:
  file.managed:
    - name: /var/lib/AccountsService/users/{{ my_user }}
    - makedirs: True
    - contents: |
        [User]
        SystemAccount=true
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.ssh:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 700
    - makedirs: True
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.screenrc:
  file.managed:
    - source: salt://files/env/screenrc
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja
    - context:
      user: {{ my_user }}

/home/{{ my_user }}/.gradle/init.d:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755
    - makedirs: True
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.gradle/init.d/ide-isolation.gradle:
  file.managed:
    - source: salt://files/gradle/ide-isolation.gradle
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja
    - context:
      user: {{ my_user }}
    - require:
      - file: /home/{{ my_user }}/.gradle/init.d

/home/{{ my_user }}/.config/Code/User:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755
    - makedirs: True
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.config/Code/User/settings.json:
  file.managed:
    - source: salt://files/code/settings.json
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja
    - context:
      user: {{ my_user }}
    - require:
      - file: /home/{{ my_user }}/.config/Code/User

{% include './snippets/vim.jinja' %}

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
