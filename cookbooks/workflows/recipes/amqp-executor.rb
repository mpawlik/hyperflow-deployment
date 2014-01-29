package 'build-essential' 
package 'ruby2.0'
package 'ruby2.0-dev'
package 'libxml2-dev'
package 'libxslt-dev'


remote_file "/tmp/hyperflow-amqp-executor.gem" do
 source "https://dl.dropboxusercontent.com/u/81819/hyperflow-amqp-executor.gem"
 action :create_if_missing 
end


gem_package "hyperflow-amqp-executor" do
  source "/tmp/hyperflow-amqp-executor.gem"
  options("--no-ri --no-rdoc")
  action :install
end

# Create the credentials file
template "/etc/amqp-executor-credentials" do
    source "amqp-executor-credentials.erb"
    owner "ubuntu"
    group "ubuntu"
    mode "0600"
end

# Create the credentials file
cookbook_file "/var/lib/cloud/scripts/per-boot/start-executor.sh" do
    source "start-executor.sh"
    owner "root"
    group "root"
    mode "0755"
end

