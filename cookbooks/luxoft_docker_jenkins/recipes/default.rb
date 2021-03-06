#
# Cookbook Name:: luxoft_docker_jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'luxoft_docker::install'

# Pull latest Jenkins image
docker_image 'jenkins' do
  tag node['luxoft_docker_jenkins']['tag']
  action :pull
end

# Create Jenkins volume to store configs

docker_volume 'jenkins-volume' do
  action :create
end

# Run container for jenkins
docker_container 'jenkins' do
  tag node['luxoft_docker_jenkins']['tag']
  port node['luxoft_docker_jenkins']['port']
  restart_policy 'always'
  volumes 'myjenkins:/var/jenkins_home'
end
