#!/bin/bash
<%include file="/shell/bootstrap_functions.sh"/>\
<%namespace name="users" file="/includes/users.mako"/>\
<%namespace name="conf" file="/includes/conf.mako"/>\
<%namespace name="repos" file="/includes/repos.mako"/>\
<%namespace name="hosts" file="/includes/hosts.mako"/>\

${hosts.host_file(self.attr.machine_name, self.attr.domain, self.attr.ip_addr)}
${repos.epel()}

yum install -y salt-master salt-minion git

${conf.saltmaster(self.attr.machine_name)}
${conf.saltminion()}
${users.wendallc()}
${users.saltmaster(self.attr.machine_name)}

service salt-master start
service salt-minion start
# Wait 30 seconds to give time for keys to generate after minion starts
sleep 30
salt-key -A

## highstate needs run twice if service gets restarted (which it will)
echo "Please run: salt '${self.attr.machine_name}.${self.attr.domain}' state.highstate"
echo "May need to run multple times to properly initialize a new master."
