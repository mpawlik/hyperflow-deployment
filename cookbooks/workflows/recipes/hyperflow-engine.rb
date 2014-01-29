package 'redis-server' 
 
include_recipe "nodejs::default"


tarball = "v1.0.0-beta-5.zip"
hyperflow_dir="/home/ubuntu/hyperflow-1.0.0-beta-5"

remote_file "/tmp/#{tarball}" do
 source "https://github.com/dice-cyfronet/hyperflow/archive/#{tarball}"
 action :create_if_missing 
end

execute "unzip" do
 cwd "/home/ubuntu"
 command "unzip /tmp/#{tarball}"
 creates hyperflow_dir
 action :run
end

execute "install npm dependencies" do
 cwd hyperflow_dir
 command "npm install -d"
end