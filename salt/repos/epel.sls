epel-release:
  pkg:
    - removed

/etc/yum.repos.d/epel.repo:
  file.managed:
    - source: salt://files/yum.repos.d/epel.repo
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: epel-release

/etc/yum.repos.d/epel-testing.repo:
  file.managed:
    - source: salt://files/yum.repos.d/epel-testing.repo
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: epel-release
