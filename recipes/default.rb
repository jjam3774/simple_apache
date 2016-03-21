#
# Cookbook Name:: simple_apache_setup
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.




case node.platform
  when "ubuntu"
    execute "apt_update" do
      command "apt-get update"
    end
    package "apache2"
    service "apache2" do
      action [:enable, :start]
    end
  when "centos"
    package "httpd"
    service "httpd" do
      action [:enable, :start]
    end
end
