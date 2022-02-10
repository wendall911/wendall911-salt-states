evolution:
  pkg:
    - removed

shotwell:
  pkg:
    {% if grains['fqdn'] == 'tjc.localdomain' -%}
    - installed
    {%- else %}
    - removed
    {%- endif %}

gnome-boxes:
  pkg:
    - removed

empathy:
  pkg:
    - removed

devassistant:
  pkg:
    - removed

anaconda-live:
  pkg:
    - removed

gnome-contacts:
  pkg:
    - removed

gnome-weather:
  pkg:
    - removed

gnome-maps:
  pkg:
    - removed

rhythmbox:
  pkg:
    - removed

gnome-tour:
  pkg:
    - removed

cheese:
  pkg:
    - removed
