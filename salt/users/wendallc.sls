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

{{ my_user }}_ssh:
  ssh_auth:
    - present
    - user: {{ my_user }}
    - source: salt://files/ssh/{{ my_user }}_id_dsa.pub
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.gitconfig:
  file.managed:
    - source: salt://files/env/gitconfig
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja
    - defaults:
      my_name: Wendall Cada
      my_email: wendallc@83864.com

/home/{{ my_user }}/.bashrc:
  file.managed:
    - source: salt://files/env/bashrc
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

/root/.bashrc:
  file.managed:
    - source: salt://files/env/root_bashrc
    - user: root
    - group: root
    - mode: 644

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

{% if grains['fqdn'] == 'build.83864.com' %}
/home/{{ my_user }}/RPMBUILD_README:
  file.managed:
    - source: salt://files/readme/rpmbuild.md
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
{% endif %}

{% if grains['fqdn'] == 'wlaptop.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' %}

/usr/share/themes/Adwaita/metacity-1/metacity-theme-3.xml:
  file.patch:
    - source: salt://files/patches/metacity-0001-Remove-Max-Titlebar.patch
    - hash: md5=7258da7923c51a4d27c7631bb62aef85

{% endif %}
