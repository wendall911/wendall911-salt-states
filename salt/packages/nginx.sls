nginx:
  pkg:
    - installed
  service:
    - running
    - name: nginx
    - enable: True

certbot:
  pkg:
    - installed

python3-certbot-nginx:
  pkg:
    - installed
