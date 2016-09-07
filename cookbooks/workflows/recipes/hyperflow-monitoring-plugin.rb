package 'unzip'


tarball = "master.tar.gz"

execute "install hyperflow monitoring plugin" do
  command "npm install https://github.com/dice-cyfronet/hyperflow-monitoring-plugin/archive/#{tarball}"
end

template "/node_modules/hyperflow-monitoring-plugin/hyperflowMonitoringPlugin.config.js" do
  source "hyperflowMonitoringPlugin.config.js.erb"
  owner "root"
  group "root"
  mode "0644"
end