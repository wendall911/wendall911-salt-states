virtualbox-repo:
  pkgrepo.managed:
    - humanname: Copr repo for syncthing owned by beno
    - baseurl: https://copr-be.cloud.fedoraproject.org/results/beno/syncthing/fedora-$releasever-$basearch/
    - gpgkey: https://copr-be.cloud.fedoraproject.org/results/beno/syncthing/pubkey.gpg
    - gpgcheck: 1
