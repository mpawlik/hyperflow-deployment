package 'gcc' 
package 'build-essential' 


tarball = "Montage_v3.3_patched_4.tar.gz"
montage_dir="/home/ubuntu/Montage_v3.3_patched_4"

remote_file "/tmp/#{tarball}" do
 source "http://pegasus.isi.edu/montage/#{tarball}"
 action :create_if_missing 
end

execute "tar" do
 cwd "/home/ubuntu"
 command "tar zxv --no-same-owner --no-same-permissions -f /tmp/#{tarball}"
 creates montage_dir
 action :run
end


execute "make" do
  not_if "test -f #{montage_dir}/bin/mAdd"
  cwd montage_dir
  command "make"
  action :run
end




