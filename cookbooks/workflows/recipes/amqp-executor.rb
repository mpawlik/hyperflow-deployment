package 'build-essential' 
package 'ruby'
package 'ruby-dev'
package 'libxml2-dev'
package 'libxslt-dev'
package 'zlib1g-dev'

remote_file "/tmp/hyperflow-amqp-executor.gem" do
 source "https://dl.dropboxusercontent.com/u/81819/hyperflow-amqp-executor.gem"
 action :create_if_missing 
end


gem_package "hyperflow-amqp-executor" do
  source "/tmp/hyperflow-amqp-executor.gem"
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
  action :nothing
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