package 'mysql-server-5.6'

service 'mysql' do
  provider Chef::Provider::Service::Init::Debian
  action [:enable, :start]
end

mysql2_chef_gem 'default' do
  client_version '5.6'
  action :install
end

connection_info = {
  host: '127.0.0.1',
  username: 'root',
  password: ''
}

mysql_database node['blog']['database']['name'] do
  connection connection_info
  action :create
end

mysql_database_user node['blog']['database']['username'] do
  connection connection_info
  database_name node['blog']['database']['name']
  password node['blog']['database']['password']
  privileges [:all]
  action [:create, :grant]
end
