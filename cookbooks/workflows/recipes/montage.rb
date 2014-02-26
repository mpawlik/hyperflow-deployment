package 'gcc' 
package 'build-essential'

tarball = "Montage_v3.3_patched_4.tar.gz"
montage_dir="/usr/local/montage"

remote_file "/tmp/#{tarball}" do
 source "http://pegasus.isi.edu/montage/#{tarball}"
 action :create_if_missing 
end

directory montage_dir do
  owner "root"
  group "root"
  mode 00755
  action :create
end

execute "tar" do
 command "tar zxv --no-same-owner --no-same-permissions -f /tmp/#{tarball} --strip-components 1 -C #{montage_dir}"
 action :run
end


execute "make" do
  not_if "test -f #{montage_dir}/bin/mAdd"
  cwd montage_dir
  command "make"
  action :run
end

template "/etc/profile.d/montage.sh" do
    source "montage-profile.erb"
    owner "root"
    group "root"
    mode "0644"
    variables(montage_dir: montage_dir)
end


