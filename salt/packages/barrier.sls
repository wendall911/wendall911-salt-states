{% set barrier_ver = '2.1.2-1.fc29.x86_64' %}

barrier-rpm:
  pkg.installed:
    - sources:
      - barrier: salt://files/barrier/barrier-2.1.2-1.fc29.x86_64.rpm
    - watch:
      - module: barrier-rpm-check

barrier-rpm-check:
  cmd.run:
    - name: /bin/true
    - onlyif: "rpm -q barrier && ! rpm -q barrier-{{ barrier_ver }}"
  module.wait:
    - name: pkg.purge
    - pkgs: barrier
    - watch:
      - cmd: barrier-rpm-check
