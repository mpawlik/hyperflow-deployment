package 'gcc' 
package 'gfortran'
package 'build-essential' 
package 'openmpi-bin'
package 'openmpi-doc' 
package 'libopenmpi-dev' 
package 'p7zip-full'
package 'htop'
package 'gawk'
package 'autoconf'
package 'automake'


tarball = "povray-3.6.tar.gz"
povray_dir="povray-3.6.1"

remote_file "/tmp/#{tarball}" do
 source "http://www.povray.org/redirect/www.povray.org/ftp/pub/povray/Old-Versions/Official-3.62/Unix/#{tarball}"
 action :create_if_missing 
end

execute "tar" do
 command "tar zxv --no-same-owner --no-same-permissions -f /tmp/#{tarball}"
 creates "povray-3.6.1"
 action :run
end

execute "configure" do
  not_if "test -f #{povray_dir}/Makefile"
  cwd povray_dir
  command './configure COMPILED_BY="your name <email@address>"'
  action :run
end

execute "make" do
  not_if "test -f #{povray_dir}/unix/povray"
  cwd povray_dir
  command "make"
  action :run
end


execute "make install" do
  not_if "test -f /usr/local/bin/povray"
  cwd povray_dir
  command "make install"
  action :run
end



