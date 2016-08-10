package 'AppDynamics .NET Agent' do
  action :remove
end

execute 'iisreset' do
  only_if 'Get-Service W3SVC; echo $?' == 'True'
end

directory 'C:\ProgramData\AppDynamics' do
  action :delete
  recursive true
end
