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
    - sources:
      - nwg-panel: salt://files/rpms/nwg-panel-0.6.1-1.fc35.noarch.rpm

pamixer:
  pkg:
    - installed
    - sources:
      - pamixer: salt://files/rpms/pamixer-1.5-1.fc35.x86_64.rpm
