{% set my_user = 'wendallc' %}
{% set my_fullname = 'Wendall Cada' %}

{{ my_user }}:
  user.present:
    - fullname: {{ my_fullname }}
    - shell: /bin/bash
    - home: /home/{{ my_user }}
    - groups:
      - wheel

/home/{{ my_user }}/.ssh:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 700
    - makedirs: True
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.bashrc:
  file.managed:
    - source: salt://files/env/bashrc
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

/home/{{ my_user }}/.bash_profile:
  file.managed:
    - source: salt://files/env/bash_profile
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

/home/{{ my_user }}/.rgrep-excludes:
  file.managed:
    - source: salt://files/env/rgrep-excludes
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644

/home/{{ my_user }}/.screenrc:
  file.managed:
    - source: salt://files/env/screenrc
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

