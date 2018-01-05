require 'spec_helper'
describe 'freebsd_puppetserver4' do
  context 'with default values for all parameters' do
    it { should contain_class('freebsd_puppetserver4') }
  end
end
