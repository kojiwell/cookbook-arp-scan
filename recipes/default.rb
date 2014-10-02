#
# Cookbook Name:: arp-scan
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
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

include_recipe 'build-essential'
package 'libpcap'
package 'libpcap-devel'

directory node['arp-scan']['download_dir']

remote_file "#{node['arp-scan']['download_dir']}/arp-scan-#{node['arp-scan']['version']}.tar.gz" do
  source node['arp-scan']['download_url']
  owner "root"
  group "root"
  mode "0644"
end

execute "extract_arp-scan_tarball" do
  user "root"
  cwd node['arp-scan']['download_dir']
  command "tar zxf arp-scan-#{node['arp-scan']['version']}.tar.gz"
  creates "arp-scan-#{node['arp-scan']['version']}"
end

bash "install_arp-scan" do
  user "root"
  cwd "#{node['arp-scan']['download_dir']}/arp-scan-#{node['arp-scan']['version']}"
  code <<-EOH
  ./configure --prefix=#{node['arp-scan']['prefix']}
  make
  make install
  EOH
  creates node['arp-scan']['prefix']
end

