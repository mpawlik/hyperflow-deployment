version = "0.2"
tarball = "hyperflow-ui.tar.gz"
target = "hyperflow-ui"

directory "/#{target}" do
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

remote_file "/#{target}/#{tarball}" do
  source "https://github.com/hopped/hyperflow-ui/releases/download/#{version}/#{tarball}"
  action :create_if_missing
end

execute "tar" do
  cwd "/#{target}"
  command "tar zxv --no-same-owner --no-same-permissions -f /#{target}/#{tarball}"
  creates target
  action :run
end
