#
# Cookbook Name:: luxoft_docker
# Recipe:: install
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

docker_service 'default' do
  registry_mirror node['docker']['registry-mirror']
  action [:create, :start]
end
