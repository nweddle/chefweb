#
# Cookbook Name:: chefweb
# Recipe:: ssl
#
# Copyright 2015, Chef
#
# All rights reserved - Do Not Redistribute

#############################################################
# Testing setup
# Change 'end' to 'done' to break RuboCop on line 32
# Add an invalid parameter to break Foodcritic on line 30
# Rename the mod_ssl package to break ChefSpec on line 17
#############################################################

# Install the mod_ssl package
package 'mod_ssl'

#Iterate over the chefweb SSL sites
node["chefweb"]["sslsites"].each do |site_name, site_data|
  chefweb_sslsite site_name do
    port site_data["port"]
    notifies :restart, "service[httpd]"
    notifies :run, "execute[selinux_srv]"
  end
end

execute "selinux_srv" do
  command "chcon -Rv --type=httpd_sys_content_t /srv"
  #truthiness false
  action :nothing
end

# Change fwrules into 'fwrule' to break the ChefSpec test
include_recipe "chefweb::fwrules"

#Service Restarting/Start
service "httpd" do
  action [ :enable, :start ]
end
