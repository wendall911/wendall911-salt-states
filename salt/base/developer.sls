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
    - hash: md5=d7a4ff86bb7b798157c19a5a1ccf2e14
