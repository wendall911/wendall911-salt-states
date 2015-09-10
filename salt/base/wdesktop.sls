include:
  - base.workstation
  - base.developer

/var/lib/crashplan/:
  file.directory:
    - user: wendallc
    - group: wendallc
    - mode: 700
    - makedirs: True
    - require:
      - user: wendallc

