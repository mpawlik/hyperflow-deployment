package 'redis-server' 

service "redis-server" do
  action [ :stop, :disable ]
end
