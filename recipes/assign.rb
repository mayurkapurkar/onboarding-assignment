#
# Cookbook Name:: assignment1
# Recipe:: assign
#
# Copyright (c) 2022 The Authors, All Rights Reserved.
%w(
  httpd
  php
  mysql-server
).each do |pkg|
  package pkg do
    action :install
  end
end
service 'httpd' do
    action [:start,:enable]
  end
service 'mysqld' do
    action [:start,:enable]
end

node['apache']['sites'].each do |site, port_data|
  root_directory = "/var/www/mayur/#{site}"
  template "/etc/httpd/mayur/conf.d/#{site}.conf" do
    source "sites.erb"
    mode "0644"
    variables(
      :root_directory => root_directory,
      :port => port_data["port"],
      :site => site
    )
    notifies :restart, "service[httpd]"
    end
  directory root_directory do 
    mode "0755"
    recursive true
  end

  template "#{root_directory}/index.html" do
    source "app.html.erb"
    mode "0755"
    variables(
      :site => site1,
      :port => port_data["port"]
    )
    passphrase "mayur"
    sensitive :true
  end
end




  
