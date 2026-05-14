local-offline-repo:
  pkgrepo.absent:
    - humanname: Local Offline Repository
    - baseurl: file:///var/local/repo
    - enabled: 1
    - gpgcheck: 0
