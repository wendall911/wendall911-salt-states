rpmfusion-free-repo:
  pkgrepo.managed:
    - humanname: RPM Fusion for Fedora $releasever - Free
    - mirrorlist: http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-$releasever&arch=$basearch
    - gpgcheck: 0

rpmfusion-free-updates-repo:
  pkgrepo.managed:
    - humanname: RPM Fusion for Fedora $releasever - Free - Updates
    - mirrorlist: http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-$releasever&arch=$basearch
    - gpgcheck: 0

rpmfusion-nonfree-repo:
  pkgrepo.managed:
    - humanname: RPM Fusion for Fedora $releasever - Nonfree
    - mirrorlist: http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-$releasever&arch=$basearch
    - gpgcheck: 0

rpmfusion-nonfree-updates-repo:
  pkgrepo.managed:
    - humanname: RPM Fusion for Fedora $releasever - Nonfree - Updates
    - mirrorlist: http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-$releasever&arch=$basearch
    - gpgcheck: 0
