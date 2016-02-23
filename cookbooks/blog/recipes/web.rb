package 'nginx'

cookbook_file '/etc/nginx/sites-available/blog.com' do
  source 'blog.com'
  mode 00644
end

link '/etc/nginx/sites-enabled/blog.com' do
 to '/etc/nginx/sites-available/blog.com'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
end

service 'nginx' do
  action [:enable, :start]
end
