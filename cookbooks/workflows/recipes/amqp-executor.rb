package 'build-essential'
#package 'ruby'
#package 'ruby-dev'
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
