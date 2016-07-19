require_relative 'spec_helper'

describe file("#{$node['kernel']['os_info']['system_drive']}\\ProgramData\\AppDynamics") do
  it { should_not be_directory }
end

describe package('AppDynamics .NET Agent') do
  it { should_not be_installed } 
end
