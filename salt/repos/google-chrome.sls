google-chrome-repo:
  pkgrepo.managed:
    - humanname: Google Chrome Official Repo
    - baseurl: http://dl.google.com/linux/chrome/rpm/stable/$basearch
    - gpgkey: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - gpgcheck: 1
