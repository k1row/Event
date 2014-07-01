#
# Cookbook Name:: rails_book_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "libsqlite3-dev"

package "sqlite-dev" do
	package_name value_for_platform(
		%w[centos redhat suse fedora] => { "default" => "sqlite-devel"},
		"default" => "libsqlite3-dev"
		)
end
