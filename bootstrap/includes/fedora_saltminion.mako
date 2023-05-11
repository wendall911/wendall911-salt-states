#!/bin/bash
<%include file="/shell/bootstrap_functions.sh"/>\
<%namespace name="users" file="/includes/users.mako"/>\
<%namespace name="conf" file="/includes/conf.mako"/>\
<%namespace name="repos" file="/includes/repos.mako"/>\
<%namespace name="hosts" file="/includes/hosts.mako"/>\

${hosts.host_file(self.attr.machine_name, self.attr.domain, self.attr.ip_addr)}
hostnamectl set-hostname --static ${self.attr.machine_name}.${self.attr.domain}
hostnamectl set-hostname --pretty "${self.attr.pretty_name}"

${repos.fedora()}
dnf install -y salt-minion

# Patch for unpatched bug in 3005.1
# https://github.com/saltstack/salt/issues/62851
# Patch from gentoo project here: https://gitweb.gentoo.org/repo/gentoo.git/tree/app-admin/salt/files/salt-3005.1-importlib-metadata-5-r1.patch
patch /usr/lib/python3.11/site-packages/salt/utils/entrypoints.py < salt-3005.1-importlib-metadata-5-r1.patch

${conf.saltminion()}
${users.wendallc()}

service salt-minion start
