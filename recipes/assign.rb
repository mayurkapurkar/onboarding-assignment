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
<<<<<<< HEAD
template '/opt/coupa/bin/export_sanitized_backup.rb' do
  owner 'root'
  group 'deploy'
  mode '0750'
  source 'export_sanitized_backup.rb.erb'
  variables(
    mount_path: secret_mount_path,
    owner_id: ownerid
  )
end
node["apache"]["sites"].each do |site, port_data|
=======

node['apache']['sites'].each do |site, port_data|
>>>>>>> 9404fed573d043346fe2a95dc5a1a415edda2bdf
  root_directory = "/var/www/mayur/#{site}"
  template "/etc/httpd/mayur/conf.d/#{site}.conf" do
    source "sites.erb"
    mode "0644"
    variables(
      :root_directory => root_directory,
      :port => port_data["port"]
    )
    notifies :restart, "service[httpd]"
    end
  directory root_directory do 
    mode "0644"
    recursive true
  end

  template "#{root_directory}/index.html" do
    source "app.html.erb"
    mode "0644"
    variables(
      :site => site,
      :port => port_data["port"]
    )
  end
end




  
