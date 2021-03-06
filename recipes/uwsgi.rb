#
# Cookbook Name:: graphite
# Recipe:: uwsgi
#
# Copyright 2011, Heavy Water Software Inc.
# Copyright 2013, Enstratius Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "runit"

node['graphite']['uwsgi_packages'].each do |pkg|
  package pkg do
    action :install
  end
end

template "#{node['graphite']['doc_root']}/uwsgi.ini" do
  source "uwsgi.ini.erb"
  owner node['graphite']['user_account']
  group node['graphite']['group_account']
end

runit_service "graphite-web"
