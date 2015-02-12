package 'gcc' 
package 'gfortran'
package 'build-essential' 



# Install Molecular Dynamics OpenMP version from source

md_tarball = "MD_v4_OMP.tar.gz"
md_dir="/home/ubuntu/MD_v4_OMP"


remote_file "/home/paasage/#{md_tarball}" do
 source "https://www.dropbox.com/s/alho0mwrg4dg45b/#{md_tarball}"
 action :create_if_missing 
end

execute "tar" do
 cwd "/home/paasage"
 command "tar zxv --no-same-owner --no-same-permissions -f /home/paasage/#{md_tarball}"
 creates md_dir
 action :run
end

execute "compile" do
  not_if "test -f #{md_dir}/src/main"
  cwd md_dir
  command "cd src && make TARGET=RELEASE OMP=1 ARCH=CPU COMPILER=gcc && cp CMD_CPU main"
  action :run
end
