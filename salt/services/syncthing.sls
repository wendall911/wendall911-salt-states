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
      - pkg: syncthing-rpm

