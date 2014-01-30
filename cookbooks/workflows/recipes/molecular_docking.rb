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


# create paasage user

user "paasage" do
  supports :manage_home => true
  comment "PaaSage User"
  gid "users"
  home "/home/paasage"
  shell "/bin/bash"
end

# Install Molecular Docking from source

md_tarball = "Molecular_Docking.tar.gz"
md_dir="/home/paasage/Molecular_Docking"

remote_file "/home/paasage/#{md_tarball}" do
 source "https://dl.dropboxusercontent.com/s/r4sqm2wt04a5ysj/#{md_tarball}"
 action :create_if_missing 
end

execute "tar" do
 cwd "/home/paasage"
 command "tar zxv --no-same-owner --no-same-permissions -f /home/paasage/#{md_tarball}"
 creates md_dir
 action :run
end

execute "compile" do
  not_if "test -f #{md_dir}/src/cmd"
  cwd md_dir
  command "./compile.sh"
  action :run
end

# Install scripts into /home/paasage

remote_file "/home/paasage/script.tgz" do
 source "https://dl.dropboxusercontent.com/s/taj1d832plk0gkm/script.tgz"
 action :create_if_missing 
end

execute "tar" do
 cwd "/home/paasage"
 command "tar zxv --no-same-owner --no-same-permissions -f /home/paasage/script.tgz && chmod a+rx script/*.sh"
 creates "/home/paasage/script"
 action :run
end

