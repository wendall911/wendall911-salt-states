sway:
  pkg:
    - installed

mako:
  pkg:
    - installed

wl-clipboard:
  pkg:
    - installed

kanshi:
  pkg:
    - installed

blueberry:
  pkg:
    - installed

nwg-panel:
  pkg:
    - installed
    - fromrepo: rawhide

pamixer:
  pkg.installed:
    - sources:
      - pamixer: salt://files/rpms/pamixer-1.5-1.fc35.x86_64.rpm
