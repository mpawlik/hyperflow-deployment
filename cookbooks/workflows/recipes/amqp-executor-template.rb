# Create the credentials file
template "/etc/hyperflow-amqp-executor.yml" do
  source "config.yml.erb"
  owner "root"
  group "root"
  mode "0644"
end
