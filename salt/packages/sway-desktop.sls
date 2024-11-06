sway:
  pkg:
    - installed

mako:
  pkg:
    - installed

wl-clipboard:
  pkg:
    - installed

pamixer:
  pkg:
    - installed

wofi:
  pkg:
    - installed

waybar:
  pkg:
    - installed

wlogout:
  pkg:
    - installed

wf-recorder:
  pkg:
    - installed

{% if grains['fqdn'] == 'framework.localdomain' or grains['fqdn'] == 'wlaptop.localdomain' -%}
light:
  pkg:
    - installed
{%- endif %}

fontawesome-fonts-all:
  pkg:
    - installed

grim:
  pkg:
    - installed

slurp:
  pkg:
    - installed

nm-connection-editor:
  pkg:
    - installed

blueman:
  pkg:
    - installed

pavucontrol:
  pkg:
    - installed

alacritty:
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

