#!/bin/bash
<%include file="/shell/bootstrap_functions.sh"/>\
<%namespace name="users" file="/includes/users.mako"/>\
<%namespace name="conf" file="/includes/conf.mako"/>\
<%namespace name="repos" file="/includes/repos.mako"/>\

hostnamectl set-hostname --static ${self.attr.machine_name}.${self.attr.domain}
timedatectl set-timezone America/Los_Angeles

${repos.salt()}
dnf install -y salt-master salt-minion git

${conf.saltmaster(self.attr.machine_name)}
${conf.saltminion()}
${users.wendallc()}
${users.saltmaster(self.attr.machine_name)}
