agent = node['appdynamics']['dotnet_agent']
controller = node['appdynamics']['controller']
proxy = node['appdynamics']['http_proxy']

version = agent['version'] || node['appdynamics']['version']

install_directory = agent['install_dir']
temp_path = "#{node['kernel']['os_info']['windows_directory']}\\Temp"
install_log_file = "#{temp_path}\\DotnetAgentInstall.log"

package_source = agent['source']
unless package_source
  package_source = "#{node['appdynamics']['packages_site']}/dotnet/#{version}/dotNetAgentSetup"
  package_source << '64' if node['kernel']['machine'] == 'x86_64'
  package_source << "-#{version}.msi"
end

# Installing the agent
windows_package 'AppDynamics .NET Agent' do
  source package_source
  options "/l*v \"#{install_log_file}\" INSTALLDIR=\"#{install_directory}\""
end