#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/var/www/events' do
	owner 'ops'
	action :create
	recursive true
end

template '/etc/nginx/sites-available/default' do
	action :create
	source "default.conf.erb"
	notifies :reload, 'service[nginx]'
end
