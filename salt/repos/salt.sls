salt-latest:
  pkgrepo.managed:
    - humanname: Salt Repo for Salt v3007 STS
    - baseurl: https://packages.broadcom.com/artifactory/saltproject-rpm/
    - gpgkey: https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public
    - gpgcheck: 1
    - exclude: ['*3006*', '*3008*', '*3009*', '*3010*']
    - skip_if_unavailable: True
