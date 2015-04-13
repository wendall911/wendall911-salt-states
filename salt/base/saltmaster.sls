include:
  - users.mc
  - base.server
  - services.saltmaster
  - packages.scl-utils
  - packages.python33
  - packages.java-17-headless

/opt/minecraft:
  file.directory:
    - user: mc
    - group: mc
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group

/opt/minecraft/minecraft.py:
  file.managed:
    - source: salt://files/emsm/minecraft.py
    - user: mc
    - group: mc
    - mode: 0775

/usr/bin/minecraft:
  file.symlink:
    - target: /opt/minecraft/minecraft.py
