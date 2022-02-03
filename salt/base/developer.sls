include:
  - packages.gcc
  - packages.meld
  - packages.git
  - packages.vim-enhanced
  - packages.nodejs
  - packages.utils
  - packages.sway-desktop

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
