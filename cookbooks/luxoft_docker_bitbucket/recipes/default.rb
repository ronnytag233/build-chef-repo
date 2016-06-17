#
# Cookbook Name:: luxoft_docker_bitbucket
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'luxoft_docker::install'

# Pull latest bitbucket image
docker_image 'atlassian/bitbucket-server' do
  tag node['luxoft_docker_bitbucket']['tag']
  action :pull
  notifies :redeploy, 'docker_container[bitbucket]', :delayed
end

# Create bitbucket volume to store configs

docker_volume 'bitbucket-volume' do
  action :create
end

directory '/var/lib/docker/volumes/bitbucket-volume/_data' do
  owner 'daemon'
  group 'daemon'
  recursive true
  action :create
end

# Run container for bitbucket
docker_container 'bitbucket' do
  tag node['luxoft_docker_bitbucket']['tag']
  port node['luxoft_docker_bitbucket']['port']
  repo 'atlassian/bitbucket-server'
  restart_policy 'always'
  volumes 'bitbucket-volume:/var/atlassian/application-data/bitbucket'
  action :nothing
end
