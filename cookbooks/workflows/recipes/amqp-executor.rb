package 'build-essential' 
package 'ruby'
package 'ruby-dev'
package 'libxml2-dev'
package 'libxslt-dev'
package 'zlib1g-dev'


gem_package "hyperflow-amqp-executor" do
  action :install
end

# Create the credentials file
template "/etc/hyperflow-amqp-executor.yml" do
    source "config.yml.erb"
    owner "root"
    group "root"
    mode "0644"
end

service "hyperflow-amqp-executor" do
  supports :restart => true, :start => true, :stop => true
  if node['paasage_services']['enable'] == false
    action [ :stop, :disable ]
  else
    action [ :start, :enable ]
  end
end


template "hyperflow-amqp-executor" do
  path "/etc/init.d/hyperflow-amqp-executor"
  source "hyperflow-amqp-executor.erb"
  owner "root"
  group "root"
  mode "0755"
  notifies :enable, "service[hyperflow-amqp-executor]"
  notifies :start, "service[hyperflow-amqp-executor]"
end
