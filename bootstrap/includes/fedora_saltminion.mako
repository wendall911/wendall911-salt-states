#!/bin/bash
<%include file="/shell/bootstrap_functions.sh"/>\
<%namespace name="users" file="/includes/users.mako"/>\
<%namespace name="conf" file="/includes/conf.mako"/>\
<%namespace name="repos" file="/includes/repos.mako"/>\

hostnamectl set-hostname --static ${self.attr.machine_name}.${self.attr.domain}
hostnamectl set-hostname --pretty "${self.attr.pretty_name}"

${repos.salt()}
dnf install -y salt-minion

${conf.saltminion()}
${users.wendallc()}

service salt-minion start
