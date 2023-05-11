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
    - sources:
      - pamixer: salt://files/rpms/pamixer-1.6-1.fc38.x86_64.rpm

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

{% if grains['fqdn'] == 'framework.localdomain' -%}
light:
  pkg:
    - installed
{%- endif %}

fontawesome5-fonts-all:
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

