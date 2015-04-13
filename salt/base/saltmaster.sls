include:
  - users.mc
  - base.server
  - services.saltmaster
  - packages.scl-utils
  - packages.python33
  - packages.java-17-headless

/opt/minecraft:
  file.directory:
    - user: minecraft
    - group: minecraft
    - mode: 755
    - makedirs: True
    - recurse:
      - user
      - group

/opt/minecraft/minecraft.py:
  file.managed:
    - source: salt://files/emsm/minecraft.py
    - user: minecraft
    - group: minecraft
    - mode: 0775

/opt/minecraft/minecraft.sh:
  file.managed:
    - source: salt://files/emsm/minecraft.sh
    - user: minecraft
    - group: minecraft
    - mode: 0775

/usr/bin/minecraft:
  file.symlink:
    - target: /opt/minecraft/minecraft.sh
