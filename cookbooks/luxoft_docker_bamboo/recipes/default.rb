#
# Cookbook Name:: luxoft_docker_bamboo
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'luxoft_docker::install'

# Pull latest bamboo image
docker_image 'hwuethrich/bamboo-server' do
  tag node['luxoft_docker_bamboo']['tag']
  action :pull
  notifies :redeploy, 'docker_container[bamboo]', :delayed
end

# Create bamboo volume to store configs

docker_volume 'bamboo-volume' do
  action :create
end

# Run container for bamboo
docker_container 'bamboo' do
  tag node['luxoft_docker_bamboo']['tag']
  port node['luxoft_docker_bamboo']['port']
  repo 'hwuethrich/bamboo-server'
  restart_policy 'always'
  volumes 'bamboo-volume:/home/bamboo'
  action :nothing
end
