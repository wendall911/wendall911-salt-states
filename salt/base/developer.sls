include:
  - packages.gcc
  - packages.meld
  - packages.git
  - packages.vim-enhanced
  - packages.nodejs
  - packages.utils
  - packages.sway-desktop
  - packages.seahorse

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
