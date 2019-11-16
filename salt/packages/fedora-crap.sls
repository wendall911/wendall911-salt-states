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
