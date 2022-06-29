{% set my_user = 'ashar' %}
{% set my_fullname = 'Ashar' %}

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
      my_name: Ashar Cada
      my_email: ashar@83864.com

/home/{{ my_user }}/.npmrc:
  file.managed:
    - source: salt://files/env/npmrc
    - user: {{ my_user }}
    - group: {{ my_user }}
    - mode: 644
    - template: jinja

