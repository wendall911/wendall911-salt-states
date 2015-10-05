syncthing-rpm:
  pkg.installed:
    - name: syncthing
    - version: 0.11.26-1.fc22
    - sources:
      - syncthing: salt://files/syncthing/syncthing-0.11.26-1.fc22.x86_64.rpm
