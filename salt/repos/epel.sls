epel-release:
  pkg:
    - removed

/etc/yum.repos.d/epel.repo:
  file.managed:
    {% if grains['osrelease'] == '6.3' %}
    - source: salt://files/yum.repos.d/epel.repo
    {% elif grains['osrelease'] == '5.9' %}
    - source: salt://files/yum.repos.d/epel-el5.repo
    {% endif %}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: epel-release

/etc/yum.repos.d/epel-testing.repo:
  file.managed:
    {% if grains['osrelease'] == '6.3' %}
    - source: salt://files/yum.repos.d/epel-testing.repo
    {% elif grains['osrelease'] == '5.9' %}
    - source: salt://files/yum.repos.d/epel-testing-el5.repo
    {% endif %}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: epel-release
