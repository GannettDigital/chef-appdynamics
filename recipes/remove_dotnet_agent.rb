package 'AppDynamics .NET Agent' do
  action :remove
end

directory 'C:\ProgramData\AppDynamics' do
  action :delete
  recursive true
end
