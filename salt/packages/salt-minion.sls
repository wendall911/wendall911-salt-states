salt-minion:
  pkg.installed:
    {% if grains['osfullname'] == 'CentOS' or grains['osfullname'] == 'Amazon Linux AMI' %}
    - fromrepo: essentialed-centos
    {% elif grains['osfullname'] == 'Fedora' %}
    - fromrepo: essentialed-fedora
    {% endif %}
  service:
    - running
    - enable: True
    - require:
      - file: /etc/salt/minion
      - pkg: salt-minion
      - file: /etc/yum.repos.d/essentialed.repo
    - watch:
      - file: /etc/salt/minion
      - pkg: salt-minion

/etc/salt/minion:
  file.managed:
    - source: salt://files/salt/minion
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: salt-minion
