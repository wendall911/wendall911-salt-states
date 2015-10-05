{% set syncthing_ver = '0.11.26-1.fc22.x86_64' %}

syncthing-rpm:
  pkg.installed:
    - sources:
      - syncthing: salt://files/syncthing/syncthing-0.11.26-1.fc22.x86_64.rpm
    - watch:
      - module: syncthing-rpm-check

syncthing-rpm-check:
  cmd.run:
    - name: /bin/true
    - onlyif: "rpm -q syncthing && ! rpm -q syncthing-{{ syncthing_ver }}"
  module.wait:
    - name: pkg.purge
    - pkgs: syncthing
    - watch:
      - cmd: syncthing-rpm-check
