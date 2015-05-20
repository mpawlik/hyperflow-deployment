package 'redis-server' 

service "redis-server" do
  if node['paasage_services']['enable'] == false
    action [ :stop, :disable ]
  end
end
