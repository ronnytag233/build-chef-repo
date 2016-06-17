#
# Cookbook Name:: luxoft_docker_gocd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'luxoft_docker::install'

# Pull latest gocd image
docker_image 'gocd/gocd-server' do
  tag node['luxoft_docker_gocd']['tag']
  action :pull
  notifies :redeploy, 'docker_container[gocd]', :delayed
end

# Create gocd volume to store configs

docker_volume 'gocd-volume' do
  action :create
end

# Run container for gocd
docker_container 'gocd' do
  tag node['luxoft_docker_gocd']['tag']
  port node['luxoft_docker_gocd']['port']
  repo 'gocd/gocd-server'
  restart_policy 'always'
  volumes 'gocd-volume:/var/lib/go-server'
  action :nothing
end
