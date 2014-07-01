#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
 include_recipe "rails_book_cookbook::ops_user"

 directory "/home/ops/" do
 	action :create
 	owner "ops"
 	mode "0700"
 end

 directory "/home/ops/.ssh" do
 	action :create
 	owner "ops"
 	mode "0700"
 end

 cookbook_file "/home/ops/.ssh/id_rsa" do
 	action :create
 	owner "ops"
 	mode "0600"
 end

 cookbook_file "/home/ops/.ssh/authorized_keys" do
 	action :create
 	owner "ops"
 	mode "0600"
 end
