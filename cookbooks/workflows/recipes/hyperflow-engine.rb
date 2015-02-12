package 'redis-server' 
package 'unzip'
package 'build-essential' 


#include_recipe "nodejs"
#include_recipe "nodejs::npm"

 
version = 'develop'
tarball = "#{version}.tar.gz"

execute "install hyperflow" do
 command "npm install https://github.com/dice-cyfronet/hyperflow/archive/#{tarball}"
end