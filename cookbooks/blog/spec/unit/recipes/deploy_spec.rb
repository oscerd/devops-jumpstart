require 'spec_helper'

describe 'blog::deploy' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new
    runner.converge(described_recipe)
  end

  it 'creates deploy user' do
    expect(chef_run).to create_user('deploy')
  end

  it 'configs authorized keys' do
    expect(chef_run).to create_cookbook_file('/home/deploy/.ssh/authorized_keys').with(mode: 0600)
  end
end
