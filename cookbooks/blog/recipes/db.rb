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

mysql_database 'blog' do
  connection connection_info
  action :create
end

mysql_database_user 'blog' do
  connection connection_info
  database_name 'blog'
  password 'blog'
  privileges [:all]
  action [:create, :grant]
end
