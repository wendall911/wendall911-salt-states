/etc/yum.repos.d/rpmfusion-free-rawhide.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-free-rawhide.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-free.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-free.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-free-updates.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-free-updates.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-free-updates-testing.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-free-updates-testing.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-nonfree-rawhide.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-nonfree-rawhide.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-nonfree.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-nonfree.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-nonfree-updates.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-nonfree-updates.repo
    - user: root
    - group: root
    - mode: 644

/etc/yum.repos.d/rpmfusion-nonfree-updates-testing.repo:
  file.managed:
    - source: salt://files/yum.repos.d/rpmfusion-nonfree-updates-testing.repo
    - user: root
    - group: root
    - mode: 644

