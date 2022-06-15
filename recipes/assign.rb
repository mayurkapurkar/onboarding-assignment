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
