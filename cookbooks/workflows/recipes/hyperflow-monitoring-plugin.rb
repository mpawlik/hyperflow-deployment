package 'unzip'



execute "install hyperflow monitoring plugin" do
  command "npm install https://github.com/dice-cyfronet/hyperflow-monitoring-plugin/archive/feature/visor_integration.zip"
end

template "/node_modules/hyperflow-monitoring-plugin/hyperflowMonitoringPlugin.config.js" do
  source "hyperflowMonitoringPlugin.config.js.erb"
  owner "root"
  group "root"
  mode "0644"
end