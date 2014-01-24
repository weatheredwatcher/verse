# projects/myproject/vagrant/chef/cookbooks/my_cookbook/recipes/server.rb

#execute "install mongo key" do
#  command "apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10"
#  not_if "apt-key list| /bin/grep -c 10gen"
#end

#execute "install mongo repo" do
#  command "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' >> /etc/apt/sources.list"
#  not_if "grep 'http://downloads-distro.mongodb.org/repo/ubuntu-upstart' -c /etc/apt/sources.list"
#end

execute "update apt" do
  # we are telling apt to update but be quiet and confirm any prompts
  command "apt-get update -q -y"
end

#specify packages we want to install
package "php5"
##package "php5-mongo"
##package "mongodb-10gen"
package "php5-mysql"
package "mysql-server"

cookbook_file "/etc/apache2/sites-enabled/app.conf" do
  source "app.conf"
  group "root"
  owner "root"
end

execute "disable default site" do
  command "a2dissite default"
end

service "apache2" do
  action :restart
end
