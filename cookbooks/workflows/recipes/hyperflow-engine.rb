package 'redis-server' 
package 'unzip'
package 'build-essential' 


include_recipe "nodejs"
include_recipe "nodejs::npm"

 
version = 'master'
tarball = "#{version}.tar.gz"
hyperflow_dir="/usr/local/hyperflow"

remote_file "/tmp/#{tarball}" do
 source "https://github.com/dice-cyfronet/hyperflow/archive/#{tarball}"
 action :create_if_missing 
end

directory hyperflow_dir do
  owner "root"
  group "root"
  mode 00755
  action :create
end

execute "unzip" do
 command "tar zxv --no-same-owner --no-same-permissions -f /tmp/#{tarball} --strip-components 1 -C #{hyperflow_dir}"
 creates hyperflow_dir + '/package.json'
 action :run
end

execute "install npm dependencies" do
 cwd hyperflow_dir
 command "npm install -d"
end