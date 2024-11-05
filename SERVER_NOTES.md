## Server Notes for Future Reference

## Nginx
If using /srv for nginx services, need to do the following:
1. # semanage fcontext -a -t httpd_sys_content_t "/srv(/.*)?"
1. chown -R saltmaster:nginx /srv/*
1. restorecon -R /srv

### Setting up new website
1. add conf file in /etc/httpd/conf.d/{sitename}.conf
```
server {
    server_name {sitename} www.{sitename};

    location / {
        root /srv/{sitename};
    }

    listen 80;
}
```
1. create directory /srv/{sitename}
1. follow nginx instructions above to ensure labeling and permissions are correct
1. Generate ssl certs for domain
  1. # certbot --nginx -d {sitename} www.{sitename}
  1. Certbot will now manage this file and update certs.
