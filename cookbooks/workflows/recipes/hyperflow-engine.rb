package 'redis-server' 
package 'unzip'
package 'build-essential' 

version = 'develop'
tarball = "#{version}.tar.gz"

execute "install hyperflow" do
 command "npm install https://github.com/hopped/hyperflow/archive/#{tarball}"
end
