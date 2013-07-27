/etc/yum.repos.d/google-chrome.repo:
  file.managed:
    - source: salt://files/yum.repos.d/google-chrome.repo
    - user: root
    - group: root
    - mode: 644
    - skip_verify: True

