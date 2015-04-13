epel-release:
  pkg:
    - removed

/etc/yum.repos.d/epel.repo:
  file.absent

epel-repo:
  pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 7 - $basearch
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=epel-7&arch=$basearch
    - gpgkey: https://getfedora.org/static/352C64E5.txt
    - gpgcheck: 1

epel-testing-repo:
  pkgrepo.managed:
    - humanname: Extra Packages for Enterprise Linux 7 - Testing - $basearch
    - mirrorlist: https://mirrors.fedoraproject.org/metalink?repo=testing-epel7&arch=$basearch
    - gpgkey: https://getfedora.org/static/352C64E5.txt
    - gpgcheck: 1
