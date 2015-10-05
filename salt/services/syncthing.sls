{% if grains['fqdn'] == 'kathy.localdomain' -%}
syncthing@kathy:
{% elif grains['fqdn'] == 'tjc.localdomain' -%}
syncthing@tatiana:
{% else -%}
syncthing@wendallc:
{%- endif %}
  service.running:
    - enable: True
    - require:
      - pkg: syncthing-0.11.26-1.fc22.x86_64
    - watch:
      - pkg: syncthing-0.11.26-1.fc22.x86_64

