{% set version = '1.37.0-1' %}

Goose_download:
  file.managed:
    - name: /tmp/Goose-{{ version }}.x86_64-vulkan.rpm
    - source: https://github.com/aaif-goose/goose/releases/download/v1.37.0/Goose-{{ version }}.x86_64-vulkan.rpm
    - unless: test -f /tmp/Goose-{{ version }}.x86_64-vulkan.rpm
    - source_hash: sha256=4808c11e9f16b9749b0465dc37ab660480165fd9d0e54be7d76c1e392d88bb7b

Goose:
  pkg.installed:
    - skip_verify: true
    - source: /tmp/Goose-{{ version }}.x86_64-vulkan.rpm
    - require:
      - file: Goose_download

goose:
  pkg:
    - installed
