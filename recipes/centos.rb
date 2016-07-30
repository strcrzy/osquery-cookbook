#
# Cookbook Name:: osquery
# Recipe:: centos
#
# Copyright 2016, Jack Naglieri
#

osquery_install node['osquery']['version'] do
  action :install_centos
end

osquery_syslog node['osquery']['syslog']['filename'] do
  action :nothing
  only_if { node['osquery']['syslog']['enabled'] }
end

osquery_conf osquery_config_path do
  schedule    node['osquery']['schedule']
  packs       node['osquery']['packs']
  fim_paths   node['osquery']['file_paths']
  pack_source node['osquery']['pack_source']
  decorators  node['osquery']['decorators']
end

service osquery_daemon do
  action [:enable, :start]
end
