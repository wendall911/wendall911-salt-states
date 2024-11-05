## Server Notes for Future Reference

If using /srv for nginx services, need to do the following:
1. # setsebool -P httpd_can_network_connect on
1. chcon -Rt httpd_sys_content_t /srv
1. chown -R saltmaster:nginx /srv/*
1. restorecon -R /srv
