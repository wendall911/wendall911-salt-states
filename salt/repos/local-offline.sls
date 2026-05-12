[local-offline]
name=Local Offline Repository
baseurl=file:///var/local/repo
enabled=1
gpgcheck=0

local-offline-repo:
  pkgrepo.managed:
    - humanname: Local Offline Repository
    - baseurl: file:///var/local/repo
    - enabled: 1
    - gpgcheck: 0
