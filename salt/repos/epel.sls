epel-release:
  pkg:
    - removed

/etc/yum.repos.d/epel.repo:
  file.absent

epel-repo:
  pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 6 - $basearch
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=$basearch
    - gpgkey: https://fedoraproject.org/static/0608B895.txt
    pkgrepo.managed:
      - gpgcheck: 1

  epel-testing-repo:
    pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 6 - Testing - $basearch
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=testing-epel6&arch=$basearch
    - gpgkey: https://fedoraproject.org/static/0608B895.txt
    - gpgcheck: 1
