require 'spec_helper'

describe 'appdynamics::remove_dotnet_agent' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'windows', version: '2008R2') do |node|
      node.automatic['kernel']['machine'] = 'x86_64'
    end.converge(described_recipe)
  end

  it 'removes the appdynamics dotnet application' do
    expect(chef_run).to remove_package('AppDynamics .NET Agent')
  end

  it 'removes the appdynamics config directory' do
    expect(chef_run).to delete_directory('C:\ProgramData\AppDynamics')
  end

  it 'restarts iis' do
    expect(chef_run).to run_execute('iisreset')
  end
end
