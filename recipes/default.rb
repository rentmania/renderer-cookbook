# include_recipe 'docker_compose::installation'

cookbook_file '/etc/docker-compose_renderer.yml' do
  source 'docker-compose_renderer.yml'
  owner 'root'
  group 'root'
  mode 0640
  notifies :up, 'docker_compose_application[renderer]', :delayed
end

# Provision Compose application
docker_compose_application 'renderer' do
  action :up
  compose_files [ '/etc/docker-compose_renderer.yml' ]
end
