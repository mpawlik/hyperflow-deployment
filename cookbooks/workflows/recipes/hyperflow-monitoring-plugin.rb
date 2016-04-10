package 'unzip'


tarball = "master.tar.gz"

execute "install hyperflow monitoring plugin" do
 command "npm install https://github.com/dice-cyfronet/hyperflow-monitoring-plugin/archive/#{tarball}"
end