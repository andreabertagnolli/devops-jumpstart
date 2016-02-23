require 'spec_helper'

describe 'blog::ruby' do
  describe package('ruby') do
    it { should be_installed }
  end
end
