#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


user 'ops' do
	action :create
	supports :manage_home => true
	home "/home/ops"
	shell "/bin/bash"
end
