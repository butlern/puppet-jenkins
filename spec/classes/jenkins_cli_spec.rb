require 'spec_helper'

describe 'jenkins::cli' do
  context 'with default parameters' do
    let(:params) { { :warpath => '/usr/lib/jenkins' } }
    it { should create_class('jenkins::cli') }
    it { should contain_exec('jenkins-cli').with_command(%r{/usr/lib/jenkins}) }
  end

  context 'with custom parameters' do
    let(:params) { { :warpath => '/usr/share/jenkins' } }
    it { should create_class('jenkins::cli') }
    it { should contain_exec('jenkins-cli').with_command(%r{/usr/share/jenkins}) }
  end
end
