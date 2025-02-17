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

/home/{{ my_user }}/bin:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755
    - makedirs: True
    - require:
      - user: {{ my_user }}

{% for file in 'grimshot', 'send-clipboard', 'vimv' %}
/home/{{ my_user }}/bin/{{ file }}:
  file.managed:
    - source: salt://files/bin/{{ file }}
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 775
{% endfor %}

{{ my_user }}_ssh:
  ssh_auth:
    - present
    - user: {{ my_user }}
    - source: salt://files/ssh/{{ my_user }}_id_rsa.pub
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.vimrc:
  file.managed:
    - source: salt://files/env/vimrc
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644

{% for dir in '/', '/ftdetect', '/syntax', '/colors', '/after', '/after/ftplugin', '/autoload', '/ftplugin', '/indent', '/compiler' %}
/home/{{ my_user }}/.vim{{dir}}:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755
    - makedirs: True
    - require:
      - user: {{ my_user }}
{% endfor %}

{% for file in 'ftdetect/node.vim', 'ftdetect/sls.vim', 'syntax/jquery.vim', 'syntax/python.vim', 'syntax/sls.vim', 'syntax/perl.vim', 'syntax/mako.vim', 'syntax/pod.vim', 'syntax/actionscript.vim', 'filetype.vim', 'colors/inkpot.vim', 'colors/desert256.vim', 'after/ftplugin/python.vim', 'after/ftplugin/javascript.vim', 'ftplugin/rst.vim', 'ftplugin/sls.vim', 'indent/javascript.vim', 'compiler/gjslint.vim', 'compiler/pylint.vim', 'autoload/plug.vim' %}
/home/{{ my_user }}/.vim/{{file}}:
  file.managed:
    - source: salt://files/env/dot_vim/{{file}}
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
{% endfor %}

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

/home/{{ my_user }}/.bash_profile:
  file.managed:
    - source: salt://files/env/bash_profile
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

/home/{{ my_user }}/.npmrc:
  file.managed:
    - source: salt://files/env/npmrc
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

/home/{{ my_user }}/.local/share/systemd/user:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755
    - makedirs: True
    - require:
      - user: {{ my_user }}

/home/{{ my_user }}/.local/share/systemd/user/sway-gsd-rfkill.service:
  file.managed:
    - source: salt://files/sway/sway-gsd-rfkill.service
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644

{% if grains['fqdn'] == 'framework.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' -%}
  {% for dir in 'sway', 'wlogout', 'alacritty', 'waybar', 'lan-mouse' %}
/home/{{ my_user }}/.config/{{ dir }}:
  file.directory:
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755
    - makedirs: True
    - require:
      - user: {{ my_user }}
  {% endfor %}
{%- endif %}

/home/{{ my_user }}/.config/sway/config:
  file.managed:
    - source: salt://files/sway/config
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

{% for file in 'layout', 'style.css' %}
/home/{{ my_user }}/.config/wlogout/{{ file }}:
  file.managed:
    - source: salt://files/wlogout/{{ file }}
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
{% endfor %}

{% for file in 'config', 'style.css' %}
/home/{{ my_user }}/.config/waybar/{{ file }}:
  file.managed:
    - source: salt://files/waybar/{{ file }}
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja
{% endfor %}

/home/{{ my_user }}/.config/alacritty/alacritty.yml:
  file.managed:
    - source: salt://files/alacritty/alacritty.yml
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644

/home/{{ my_user }}/.config/alacritty/alacritty.toml:
  file.managed:
    - source: salt://files/alacritty/alacritty.toml
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644

/home/{{ my_user }}/bin/lan-mouse:
  file.managed:
    - source: salt://files/lan-mouse/lan-mouse
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 755

/home/{{ my_user }}/.local/share/applications/lan-mouse.desktop:
  file.managed:
    - source: salt://files/lan-mouse/lan-mouse.desktop
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644

{% if grains['fqdn'] == 'framework.localdomain' or grains['fqdn'] == 'wdesktop.localdomain' -%}
/home/{{ my_user }}/.config/lan-mouse/config.toml:
  file.managed:
    - source: salt://files/lan-mouse/{{ grains.fqdn.partition('.')[0] }}.config.toml
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
{%- endif %}
