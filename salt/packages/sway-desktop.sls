sway:
  pkg:
    - installed

mako:
  pkg:
    - installed

wl-clipboard:
  pkg:
    - installed

wdisplays:
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

i3status-rust:
  pkg:
    - installed

network-manager-applet:
  pkg:
    - installed

## See https://wiki.archlinux.org/title/GNOME/Keyring#Automatically_change_keyring_password_with_user_password

/etc/pam.d/passwd:
  file.patch:
    - source: salt://files/pam/passwd.patch

/etc/pam.d/gdm-password:
  file.patch:
    - source: salt://files/pam/gdm-password.patch

/usr/share/wayland-sessions/sway.desktop:
  file.patch:
    - source: salt://files/sway/sway.desktop.patch

/usr/bin/sway-session:
  file.managed:
    - source: salt://files/sway/sway-session
    - user: root
    - group: root
    - mode: 755

