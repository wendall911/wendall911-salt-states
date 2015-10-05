{% set syncthing_ver = '0.11.26-1.fc22.x86_64' %}

syncthing-rpm:
  pkg.installed:
    - sources:
      - syncthing: salt://files/syncthing/syncthing-{{ syncthing_ver }}.rpm
    - watch:
      - module: syncthing-check

syncthing-check:
  cmd.run:
    - name: /bin/true
    - onlyif: "rpm -q syncthing && ! rpm -q syncthing-{{ syncthing_ver }}"
  module.wait:
    - name: pkg.purge
      pkgs:
        - syncthing
    - watch:
      - cmd: syncthing-check
