require 'spec_helper'

describe 'blog::db' do
  describe package('mysql-server-5.6') do
    it { should be_installed }
  end

  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }

    describe port(3306) do
      it { should be_listening }
    end

    describe file('/var/run/mysqld/mysqld.sock') do
      it { should be_socket }
    end

    describe 'blog database' do
      describe command("echo \'SHOW DATABASES LIKE 'blog'\' | mysql --user=blog --password=blog") do
        its(:stderr) { should match /blog/ }
      end
    end
  end
end
