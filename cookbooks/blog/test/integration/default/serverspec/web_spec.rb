require 'spec_helper'

describe 'blog::web' do
  describe package('nginx') do
    it { should be_installed }
  end

  describe file('/etc/nginx/sites-available/blog.com') do
    it { should exist }
  end

  describe file('/etc/nginx/sites-enabled/blog.com') do
    it { should be_symlink }
  end

  describe service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(80) do
    it { should be_listening }
  end
end
