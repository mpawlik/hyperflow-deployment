package 'redis-server' 

service "redis-server" do
  if node['paasage_services']['enable'] == false do
    action [ :stop, :disable ]
  end
end
