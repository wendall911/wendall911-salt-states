rhscl-python33:
  pkg.installed:
    - sources:
      - repo: https://www.softwarecollections.org/en/scls/rhscl/python33/epel-7-x86_64/download/rhscl-python33-epel-7-x86_64.noarch.rpm

python33:
  pkg:
    - installed
