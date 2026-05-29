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

{% include './snippets/vim.jinja' %}
