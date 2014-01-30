package 'lighttpd'



# Install webserver and add config for exporting /paasage directory

file "/etc/lighttpd/conf-enabled/99-paasage.conf" do
  content '## NOTE: linking the NFS directory
alias.url += ( "/paasage" => "/paasage/" )
$HTTP["url"] =~ "^/paasage($|/)" { server.dir-listing = "enable" }
'
  owner "root"
  group "root"
  mode "0755"
  action :create_if_missing
end

directory "/paasage" do
  owner "root"
  group "root"
  mode "777"
  action :create
end

service "lighttpd" do
  action :restart
end