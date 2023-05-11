salt-master:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - file: /etc/salt/master
      - pkg: salt-master
    - watch:
      - file: /etc/salt/master
      - pkg: salt-master

/etc/salt/master:
  file.managed:
    - source: salt://files/salt/master
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: salt-master

# Patch for unpatched bug in 3005.1
# https://github.com/saltstack/salt/issues/62851
# Patch from gentoo project here: https://gitweb.gentoo.org/repo/gentoo.git/tree/app-admin/salt/files/salt-3005.1-importlib-metadata-5-r1.patch
/usr/lib/python3.11/site-packages/salt/utils/entrypoints.py:
  file.patch:
    - source: salt://files/salt/salt-3005.1-importlib-metadata-5-r1.patch
