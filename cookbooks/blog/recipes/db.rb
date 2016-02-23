package 'mysql-server-5.6'

service 'mysql' do
  provider Chef::Provider::Service::Init::Debian
  action [:enable, :start]
end
