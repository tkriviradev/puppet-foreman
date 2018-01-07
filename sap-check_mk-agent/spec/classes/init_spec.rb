require 'spec_helper'
describe 'agent' do
  context 'with default values for all parameters' do
    it { should contain_class('agent') }
    it { should contain_package ('check-mk-agent') }
    it { should contain_package ('xinetd') }
    it { should contain_file ('/etc/xinetd.d/check-mk-agent') }
    it { should contain_file ('/etc/check-mk-agent/logwatch.cfg') }
  end
end
