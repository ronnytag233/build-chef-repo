#
# Cookbook Name:: luxoft_docker
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'luxoft_docker::install'

# Pull latest Docker Registy image
docker_image 'registry' do
  tag node['luxoft_docker']['registry']['tag']
  action :pull
  notifies :redeploy, 'docker_container[registry]', :immediately
end

# Create Registry volume to store Docker Images

docker_volume 'registry_volume' do
  action :create
end

# Run container for jenkins
docker_container 'registry' do
  env node['luxoft_docker']['registry']['env']
  tag node['luxoft_docker']['registry']['tag']
  port node['luxoft_docker']['registry']['port']
  restart_policy 'always'
  volumes 'registry_volume:/tmp/registry-dev'
end
