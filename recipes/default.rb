#
# Cookbook Name:: chefweb
# Recipe:: default
#
# Copyright 2015, Chef
#
# All rights reserved - Do Not Redistribute

# This recipe needs more wine!  <3 Julia

package "httpd" do
  action :install
end

#Disable the default virtual host

execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.disabled" do
  only_if do
    File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :restart, "service[httpd]"
end

#Iterate over the chefweb sites
node["chefweb"]["sites"].each do |site_name, site_data|
  chefweb_site site_name do
    port site_data["port"]
    notifies :restart, "service[httpd]"
    notifies :run, "execute[selinux_srv]"
  end
end

execute "selinux_srv" do
  command "chcon -Rv --type=httpd_sys_content_t /srv"
  action :nothing
end

# Change fwrules into 'fwrule' to break the ChefSpec test
include_recipe "chefweb::fwrules"

#Service Restarting/Start
service "httpd" do
  action [ :enable, :start ]
end
