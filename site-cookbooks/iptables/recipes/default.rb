#
# Cookbook Name:: iptables
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{iptables ip6tables}.each do |srvc|
  service srvc do
    action [ :disable, :stop]
  end
end

