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
