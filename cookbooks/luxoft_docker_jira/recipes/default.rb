#
# Cookbook Name:: luxoft_docker_jira
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'luxoft_docker::install'

# Pull latest jira image
docker_image 'cptactionhank/atlassian-jira' do
  tag node['luxoft_docker_jira']['tag']
  action :pull
  notifies :redeploy, 'docker_container[jira]', :delayed
end

# Create jira volume to store configs

docker_volume 'jira-volume' do
  action :create
end

directory '/var/lib/docker/volumes/jira-volume/_data' do
  owner 'daemon'
  group 'daemon'
  recursive true
  action :create
end

# Run container for jira
docker_container 'jira' do
  tag node['luxoft_docker_jira']['tag']
  port node['luxoft_docker_jira']['port']
  repo 'cptactionhank/atlassian-jira'
  restart_policy 'always'
  volumes 'jira-volume:/var/atlassian/application-data/jira'
  action :nothing
end
