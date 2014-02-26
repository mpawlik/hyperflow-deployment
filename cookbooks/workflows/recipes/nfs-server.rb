#include_recipe "nfs::server"

directory "/exports" do
  owner "root"
  group "root"
  mode 00777
  action :create
end

nfs_export "/exports" do
  network '10.100.0.0/16'
  writeable true 
  sync true
  options ['insecure']
end

