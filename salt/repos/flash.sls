adobe-linux-repo:
  pkgrepo.managed:
    - humanname: Adobe Systems Incorporated
    - baseurl: http://linuxdownload.adobe.com/linux/$basearch
    - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
    - gpgcheck: 1
