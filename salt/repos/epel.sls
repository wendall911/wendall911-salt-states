epel-release:
  pkg:
    - removed

/etc/yum.repos.d/epel.repo:
  file.absent
#    - source: salt://files/yum.repos.d/epel.repo

/etc/yum.repos.d/epel-testing.repo:
  file.absent
#    - source: salt://files/yum.repos.d/epel-testing.repo
