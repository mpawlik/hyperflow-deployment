
directory "/exports" do
  owner "root"
  group "root"
  mode 00777
  action :create
end

nfs_host = node['hyperflow']['nfs_host']

mount "/exports" do
  device "#{nfs_host}:/exports"
  fstype "nfs"
  options "rw"
  action [:mount, :enable]
end

