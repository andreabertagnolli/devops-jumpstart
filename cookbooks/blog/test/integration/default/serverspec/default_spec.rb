require 'spec_helper'

describe 'blog::default' do
  describe package('nginx') do
      it { should be_installed }
  end
end
