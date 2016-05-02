require 'json'

dashboard_api_url = 'http://admin:admin@localhost:3000/api/datasources'

datasource = {
    name: 'hyperflow',
    type: 'influxdb',
    access: 'proxy',
    url: 'http://localhost:8086',
    password: 'root',
    user: 'root',
    database: 'hyperflow',
    basicAuth: false,
    basicAuthUser: '',
    basicAuthPassword: '',
    withCredentials: false,
    isDefault: true
}

execute 'create_datasource' do
  command '/usr/bin/curl ' + dashboard_api_url + ' -X POST -H "Content-Type: application/json;charset=UTF-8" --data-binary \'' + JSON.generate(datasource) +  '\''
end

cookbook_file '/usr/share/grafana/public/dashboards/home.json' do
  source "#{node['hyperflow-monitoring-dashboard']['home_dashboard']}"
  owner 'root'
  group 'root'
  mode '0644'
end
