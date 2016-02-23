require 'spec_helper'

describe 'blog::ruby' do
  describe package('ruby2.2') do
    it { should be_installed }
  end

  describe package('ruby2.2-dev') do
    it { should be_installed }
  end

  describe 'ruby gems are installed' do
    describe command('gem list bundler -i') do
      its(:stdout) { should match /true/ }
    end
    describe command('gem list capistrano -i') do
      its(:stdout) { should match /true/ }
    end
    describe command('gem list capistrano-scm-copy -i') do
      its(:stdout) { should match /true/ }
    end
    describe command('gem list capistrano-bundler -i') do
      its(:stdout) { should match /true/ }
    end
  end
end
